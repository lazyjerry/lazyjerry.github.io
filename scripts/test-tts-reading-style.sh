#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

node - "$repo_root/assets/js/script.js" <<'JS'
const fs = require('fs');
const vm = require('vm');

const source = fs.readFileSync(process.argv[2], 'utf8');
const ttsSource = source.slice(source.indexOf('// TTS — 語音朗讀功能'));
const timers = new Map();
let timerId = 0;

function assert(condition, message) {
  if (!condition) throw new Error(message);
}

function createElement(tag, text, options = {}) {
  return {
    tag,
    text,
    options,
    matches(selector) {
      return selector.split(',').map((item) => item.trim()).includes(tag);
    },
    closest(selector) {
      if (selector === 'li') return options.insideList ? {} : null;
      if (selector === '.site-footer') return options.insideFooter ? {} : null;
      return null;
    },
    cloneNode() {
      const clone = {
        text,
        querySelectorAll(selector) {
          if (selector !== 'a' || !options.citation) return [];
          return [{
            textContent: options.citation,
            remove() {
              clone.text = clone.text.replace(options.citation, '');
            }
          }];
        }
      };
      Object.defineProperty(clone, 'innerText', { get() { return clone.text; } });
      return clone;
    }
  };
}

const contentElements = [
  createElement('h2', '總結'),
  createElement('p', '第一段內容 [1. OpenAI]', { citation: '[1. OpenAI]' }),
  createElement('li', '清單重點'),
  createElement('p', '清單內段落', { insideList: true }),
  createElement('p', '頁尾', { insideFooter: true })
];

const buttons = {
  'tts-play': { disabled: false, addEventListener(_, handler) { this.click = handler; } },
  'tts-pause': { disabled: true, textContent: '', addEventListener(_, handler) { this.click = handler; } },
  'tts-stop': { disabled: true, addEventListener(_, handler) { this.click = handler; } },
  'tts-progress': { textContent: '' }
};

const document = {
  head: { appendChild() {} },
  body: { appendChild() {} },
  createElement() { return { style: {}, innerHTML: '', id: '', textContent: '' }; },
  getElementById(id) { return buttons[id]; },
  querySelector(selector) {
    if (selector !== '.main-content') return null;
    return { querySelectorAll() { return contentElements; } };
  }
};

const spoken = [];
const synth = {
  speaking: false,
  paused: false,
  getVoices() { return [{ lang: 'zh-TW', name: 'Test Voice' }]; },
  addEventListener() {},
  removeEventListener() {},
  speak(utterance) { this.speaking = true; spoken.push(utterance); },
  cancel() { this.speaking = false; this.paused = false; },
  pause() { this.paused = true; },
  resume() { this.paused = false; }
};

function SpeechSynthesisUtterance(text) {
  this.text = text;
}

const window = {
  speechSynthesis: synth,
  setTimeout(handler, delay) {
    const id = ++timerId;
    timers.set(id, { handler, delay });
    return id;
  },
  clearTimeout(id) { timers.delete(id); },
  setInterval() { return ++timerId; },
  clearInterval() {}
};

function runTimer(delay) {
  const entry = Array.from(timers.entries()).find(([, value]) => value.delay === delay);
  assert(entry, `找不到 ${delay}ms 計時器`);
  timers.delete(entry[0]);
  entry[1].handler();
}

vm.runInNewContext(ttsSource, {
  window,
  document,
  SpeechSynthesisUtterance,
  Array,
  console
});

buttons['tts-play'].click();
runTimer(250);
assert(spoken.length === 1, '未朗讀第一個標題片段');
assert(spoken[0].text === '總結', '標題文字錯誤');
assert(spoken[0].rate === 0.9 && spoken[0].pitch === 1.08, '標題語氣參數錯誤');
assert(buttons['tts-progress'].textContent === '1/3', '語意片段總數錯誤');

spoken[0].onend();
assert(Array.from(timers.values()).some((timer) => timer.delay === 600), '標題停頓不是 600ms');
buttons['tts-pause'].click();
assert(!Array.from(timers.values()).some((timer) => timer.delay === 600), '暫停未清除段落停頓計時器');
buttons['tts-pause'].click();

assert(spoken.length === 2, '停頓期間暫停後未繼續下一片段');
assert(spoken[1].text === '第一段內容', '引用標記未排除');
assert(spoken[1].rate === 1 && spoken[1].pitch === 1, '段落語氣參數錯誤');
spoken[1].onend();
runTimer(250);

assert(spoken.length === 3, '未朗讀清單片段');
assert(spoken[2].text === '清單重點', '清單文字錯誤');
assert(spoken[2].rate === 0.97 && spoken[2].pitch === 1, '清單語氣參數錯誤');
spoken[2].onend();
assert(Array.from(timers.values()).some((timer) => timer.delay === 350), '清單停頓不是 350ms');

buttons['tts-stop'].click();
assert(timers.size === 0, '停止後仍殘留計時器');
assert(buttons['tts-progress'].textContent === '', '停止後進度未重設');
assert(buttons['tts-play'].disabled === false, '停止後播放按鈕未恢復');

console.log('TTS 語意分段與狀態測試通過');
JS
