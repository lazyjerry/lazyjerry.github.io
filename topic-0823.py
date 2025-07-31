import os
import sys
import shutil
from datetime import datetime
import subprocess

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
TOPIC_REPORT_PATH = os.path.join(ROOT_DIR,'Topics', 'analysis-of-taiwans-recall-votes-and-nuclear-power-referendum-on-823', 'index.md')


def main():
    today_str = datetime.today().strftime('%Y-%m-%d')
    date = input(f'請輸入日期 (YYYY-MM-DD)（預設：{today_str}）：').strip()
    if not date:
        date = today_str
    folder_path = os.path.join(ROOT_DIR, 'Topics', 'analysis-of-taiwans-recall-votes-and-nuclear-power-referendum-on-823',  date)
    if not os.path.isdir(folder_path):
        print(f'找不到資料夾：{folder_path}，請確認日期輸入正確。')
        return

    filename = f"8月23日台灣第二波罷免投票與核三公投綜合預測報告.md"
    file_path = os.path.join(folder_path, filename)
    if not os.path.isfile(file_path):
        print(f'找不到檔案：{file_path}，請確認該週報檔案存在。')
        return

    # 複製內容覆蓋 weekly-report/index.md
    shutil.copyfile(file_path, TOPIC_REPORT_PATH)
    print(f'已將 {file_path} 複製並覆蓋 {TOPIC_REPORT_PATH}。')
    print("請記得確認於 README.md 補上本週檔案的目錄結構！")

    # 自動執行 git 操作
    try:
        subprocess.run(["git", "add", "."], cwd=ROOT_DIR, check=True)
        commit_msg = f"更新檔案 {date}"
        subprocess.run(["git", "commit", "-m", commit_msg], cwd=ROOT_DIR, check=True)
        subprocess.run(["git", "push"], cwd=ROOT_DIR, check=True)
        print("已自動執行 git add/commit/push。")
    except subprocess.CalledProcessError as e:
        print(f"git 操作失敗：{e}")


if __name__ == "__main__":
    main() 