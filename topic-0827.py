import os
import sys
import shutil
from datetime import datetime
import subprocess
import re

# 取得目前檔案的絕對路徑
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

# 專題報告根目錄資料夾名稱
TOPICS_FOLDER_NAME = 'Topics'
# 專題報告的資料夾名稱
TOPIC_FOLDER_NAME = 'ai-prompt-acronyms-insights'
# 報告檔案名稱
FILE_NAME = f"AI 提示詞原則中的英文簡寫：深入剖析與最佳實踐案例研究.md"
# 專題報告的 index.md 路徑
TOPIC_REPORT_PATH = os.path.join(ROOT_DIR,TOPICS_FOLDER_NAME, TOPIC_FOLDER_NAME, 'index.md')

def main():
  # 取得今天日期字串
  today_str = datetime.today().strftime('%Y-%m-%d')
  # 讓使用者輸入日期，預設為今天
  date = input(f'請輸入日期 (YYYY-MM-DD)（預設：{today_str}）：').strip()
  if not date:
    date = today_str
  # 依據日期組合出該週記告的資料夾路徑
  folder_path = os.path.join(ROOT_DIR, TOPICS_FOLDER_NAME, TOPIC_FOLDER_NAME,  date)
  # 檢查資料夾是否存在
  if not os.path.isdir(folder_path):
    print(f'找不到資料夾：{folder_path}，請確認日期輸入正確。')
    return


  # 報告檔案完整路徑
  file_path = os.path.join(folder_path, FILE_NAME)
  # 檢查檔案是否存在
  if not os.path.isfile(file_path):
    print(f'找不到檔案：{file_path}，請確認該週記檔案存在。')
    return

  # 複製報告內容，覆蓋到 index.md
  # 先讀取原本報告內容
  with open(file_path, 'r', encoding='utf-8') as f:
    original_content = f.read()

  # 要插入的 YAML front matter
  front_matter = (
    "---\n"
    "title: 專題報告週記\n"
    "description: 不定時發布使用 Manus AI 所整理的相關專題。\n"
    "og_image: https://lazyjerry.github.io/assets/og-image2.png\n"
    "---\n\n"
  )

  # 合併 front matter 與原本內容
  new_content = front_matter + original_content

  # 覆蓋寫入到 index.md
  with open(TOPIC_REPORT_PATH, 'w', encoding='utf-8') as f:
    f.write(new_content)
  print(f'已將 {file_path} 複製並覆蓋 {TOPIC_REPORT_PATH}。')
  print("請記得確認於 README.md 補上本週檔案的目錄結構！")

  # 自動執行 git 操作：add、commit、push
  # try:
  #   subprocess.run(["git", "add", "."], cwd=ROOT_DIR, check=True)  # 加入所有變更
  #   commit_msg = f"更新檔案 {date}"  # commit 訊息
  #   subprocess.run(["git", "commit", "-m", commit_msg], cwd=ROOT_DIR, check=True)  # 提交
  #   subprocess.run(["git", "push"], cwd=ROOT_DIR, check=True)  # 推送到遠端
  #   print("已自動執行 git add/commit/push。")
  # except subprocess.CalledProcessError as e:
  #   print(f"git 操作失敗：{e}")

# 程式進入點
if __name__ == "__main__":
  main() 