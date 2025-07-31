import os
import sys
import shutil
from datetime import datetime
import subprocess
import re


# 取得目前檔案的絕對路徑
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

def main():
   
  # 自動執行 git 操作：add、commit、push
  try:
      subprocess.run(["git", "add", "."], cwd=ROOT_DIR, check=True)  # 加入所有變更
      commit_msg = f"更新檔案"  # commit 訊息
      subprocess.run(["git", "commit", "-m", commit_msg], cwd=ROOT_DIR, check=True)  # 提交
      subprocess.run(["git", "push"], cwd=ROOT_DIR, check=True)  # 推送到遠端
      print("已自動執行 git add/commit/push。")
  except subprocess.CalledProcessError as e:
      print(f"git 操作失敗：{e}")

if __name__ == "__main__":
    main()  # 程式進入點