import os
import sys
import shutil
from datetime import datetime
import subprocess
import re

# 取得目前檔案所在的根目錄
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

# weekly-report 的目標檔案路徑
WEEKLY_REPORT_PATH = os.path.join(ROOT_DIR, 'Tech', 'index.md')


def main():
    # 取得今天日期字串
    today_str = datetime.today().strftime('%Y-%m-%d')
    # 讓使用者輸入日期，預設為今天
    date = input(f'請輸入日期 (YYYY-MM-DD)（預設：{today_str}）：').strip()
    if not date:
        date = today_str

    # 依據日期組合出該週記資料夾路徑
    folder_path = os.path.join(ROOT_DIR, 'Tech', date)
    if not os.path.isdir(folder_path):
        print(f'找不到資料夾：{folder_path}，請確認日期輸入正確。')
        return

    # 組合出週記檔案名稱與完整路徑
    filename = f"{date} 科技服務資訊週記.md"
    file_path = os.path.join(folder_path, filename)
    if not os.path.isfile(file_path):
        print(f'找不到檔案：{file_path}，請確認該週記檔案存在。')
        return

    # 讀取原週記內容
    with open(file_path, 'r', encoding='utf-8') as f:
        original_content = f.read()

    #TODO 如果有需要的話添加一些控制
  
    # 要插入的 YAML 前言
    yaml_header = (
        "---\n"
        "title: 科技服務資訊週記 預覽版\n"
        "description: AI 自動彙整的科技服務官方資訊週記，使用 Manus Plus （預覽版）\n"
        "---\n\n"
    )

    # 合併 YAML 前言與原內容
    new_content = yaml_header + original_content

    # 覆蓋 weekly-report/index.md
    with open(WEEKLY_REPORT_PATH, 'w', encoding='utf-8') as f:
        f.write(new_content)

    print(f'已將 {file_path} 複製並覆蓋 {WEEKLY_REPORT_PATH}，並插入 YAML 前言。')
    print("請記得確認於 README.md 補上本週檔案的目錄結構！")

    # 自動執行 git 操作：add、commit、push
    # try:
    #     subprocess.run(["git", "add", "."], cwd=ROOT_DIR, check=True)  # 加入所有變更
    #     commit_msg = f"更新檔案 {date}"  # commit 訊息
    #     subprocess.run(["git", "commit", "-m", commit_msg], cwd=ROOT_DIR, check=True)  # 提交
    #     subprocess.run(["git", "push"], cwd=ROOT_DIR, check=True)  # 推送到遠端
    #     print("已自動執行 git add/commit/push。")
    # except subprocess.CalledProcessError as e:
    #     print(f"git 操作失敗：{e}")


if __name__ == "__main__":
    main()  # 程式進入點