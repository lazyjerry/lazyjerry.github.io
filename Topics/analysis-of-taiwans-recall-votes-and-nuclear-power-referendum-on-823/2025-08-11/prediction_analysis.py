#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
8月23日台灣第二波罷免投票與核三公投成功機率預測分析
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm

# 設定中文字體
plt.rcParams['font.family'] = ['Noto Sans CJK TC', 'SimHei', 'Microsoft JhengHei']
plt.rcParams['axes.unicode_minus'] = False

def calculate_recall_probability():
    """計算罷免案成功機率"""
    
    # 第二波罷免立委資料
    recall_data = {
        '立委': ['羅明才', '林思銘', '顏寬恒', '楊瓊瓔', '江啟臣', '馬文君', '游顥'],
        '選區': ['新北市第11選區', '竹縣第2選區', '台中市第2選區', '台中市第3選區', 
                '台中市第8選區', '南投縣第1選區', '南投縣第2選區'],
        '2024得票數': [123399, 76608, 118962, 106306, 88651, 68890, 70012],
        '選區特性': ['深藍', '深藍', '深藍', '深藍', '深藍', '深藍', '深藍']
    }
    
    df_recall = pd.DataFrame(recall_data)
    
    # 罷免成功機率評估因子
    factors = {
        '第一波全敗影響': -0.3,  # 第一波全敗對士氣的負面影響
        '深藍選區特性': -0.25,   # 深藍選區對罷免的抗性
        '沉默螺旋效應': -0.2,    # 沉默螺旋效應的影響
        '核三公投分散注意力': -0.15,  # 核三公投可能分散注意力
        '藍白合作效應': -0.1,    # 藍白合作可能帶來的負面影響
        '公民團體動員': 0.2,     # 公民團體的動員能力
        '民進黨支持': 0.15       # 民進黨的支持程度
    }
    
    # 基礎成功機率（基於第一波經驗）
    base_probability = 0.1  # 10%基礎機率
    
    # 計算調整後機率
    adjustment = sum(factors.values())
    final_probability = max(0, min(1, base_probability + adjustment))
    
    # 個別立委機率調整
    individual_adjustments = {
        '羅明才': 0.02,   # 新北市相對較有機會
        '林思銘': -0.02,  # 竹縣較為保守
        '顏寬恒': 0.01,   # 台中有一定基礎
        '楊瓊瓔': 0.01,   # 台中有一定基礎
        '江啟臣': -0.01,  # 資深立委，基礎穩固
        '馬文君': 0.03,   # 潛艦國造爭議較大
        '游顥': 0.02     # 相對年輕，可能較脆弱
    }
    
    # 計算各立委成功機率
    probabilities = []
    for name in df_recall['立委']:
        prob = final_probability + individual_adjustments.get(name, 0)
        prob = max(0, min(1, prob))  # 確保在0-1之間
        probabilities.append(prob)
    
    df_recall['成功機率'] = probabilities
    
    return df_recall, final_probability

def calculate_referendum_probability():
    """計算核三公投成功機率"""
    
    # 核三公投民調數據
    poll_data = {
        '整體支持度': 0.664,
        '整體反對度': 0.221,
        '民進黨支持者同意': 0.46,
        '國民黨支持者同意': 0.87,
        '民眾黨支持者同意': 0.93,
        '中性選民同意': 0.64
    }
    
    # 公投成功需要的條件
    # 1. 同意票 > 不同意票
    # 2. 同意票 >= 投票權人總數的25%
    
    # 估算投票率（基於第一波罷免經驗）
    estimated_turnout = 0.56  # 56%投票率
    
    # 估算同意票比例
    agree_ratio = poll_data['整體支持度']
    
    # 計算同意票占投票權人總數比例
    agree_percentage_of_total = estimated_turnout * agree_ratio
    
    # 成功機率評估
    condition1_prob = 0.85  # 同意票大於不同意票的機率（基於民調）
    condition2_prob = 0.75 if agree_percentage_of_total >= 0.25 else 0.3  # 達到25%門檻的機率
    
    # 綜合成功機率
    success_probability = condition1_prob * condition2_prob
    
    analysis = {
        '民調支持度': poll_data['整體支持度'],
        '預估投票率': estimated_turnout,
        '同意票占總選舉人比例': agree_percentage_of_total,
        '條件1成功機率': condition1_prob,
        '條件2成功機率': condition2_prob,
        '綜合成功機率': success_probability
    }
    
    return analysis

def scenario_analysis():
    """情境分析"""
    
    scenarios = {
        '樂觀情境': {
            '描述': '高投票率、民進黨支持者大量棄票',
            '罷免成功機率': 0.15,
            '公投成功機率': 0.75,
            '可能性': 0.2
        },
        '基準情境': {
            '描述': '中等投票率、各方正常動員',
            '罷免成功機率': 0.05,
            '公投成功機率': 0.64,
            '可能性': 0.6
        },
        '悲觀情境': {
            '描述': '低投票率、藍白動員不力',
            '罷免成功機率': 0.02,
            '公投成功機率': 0.45,
            '可能性': 0.2
        }
    }
    
    return scenarios

def generate_predictions():
    """生成預測結果"""
    
    print("=== 8月23日台灣第二波罷免投票與核三公投成功機率預測分析 ===\n")
    
    # 罷免案分析
    recall_df, avg_recall_prob = calculate_recall_probability()
    print("一、第二波罷免案成功機率預測")
    print("=" * 50)
    for _, row in recall_df.iterrows():
        print(f"{row['立委']} ({row['選區']}): {row['成功機率']:.1%}")
    print(f"\n平均成功機率: {avg_recall_prob:.1%}")
    print(f"預測結果: 7案中可能有 {int(7 * avg_recall_prob)} 案成功")
    
    # 公投案分析
    referendum_analysis = calculate_referendum_probability()
    print(f"\n\n二、核三公投成功機率預測")
    print("=" * 50)
    print(f"民調支持度: {referendum_analysis['民調支持度']:.1%}")
    print(f"預估投票率: {referendum_analysis['預估投票率']:.1%}")
    print(f"同意票占總選舉人比例: {referendum_analysis['同意票占總選舉人比例']:.1%}")
    print(f"條件1成功機率 (同意>不同意): {referendum_analysis['條件1成功機率']:.1%}")
    print(f"條件2成功機率 (同意≥25%): {referendum_analysis['條件2成功機率']:.1%}")
    print(f"綜合成功機率: {referendum_analysis['綜合成功機率']:.1%}")
    
    # 情境分析
    scenarios = scenario_analysis()
    print(f"\n\n三、情境分析")
    print("=" * 50)
    for scenario_name, scenario_data in scenarios.items():
        print(f"\n{scenario_name} (可能性: {scenario_data['可能性']:.0%})")
        print(f"  描述: {scenario_data['描述']}")
        print(f"  罷免成功機率: {scenario_data['罷免成功機率']:.1%}")
        print(f"  公投成功機率: {scenario_data['公投成功機率']:.1%}")
    
    return recall_df, referendum_analysis, scenarios

if __name__ == "__main__":
    recall_results, referendum_results, scenario_results = generate_predictions()

