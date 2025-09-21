---
applyTo: "**/*.php"
description: "Copilot 在 PHP 檔自動產生繁中（台灣）PHPDoc、流程與用途註解之規範"
---

# PHP 註解與 PHPDoc 指南（繁中／台灣）

目的：要求 GitHub Copilot 在你完成或修改 **PHP** 程式碼後，自動產生高品質註解與 **PHPDoc**，以繁體中文（台灣用語）清楚說明用途、輸入、輸出、流程、例外與副作用。

## 通用原則

- 採 **PSR-12**，檔案首行建議 `declare(strict_types=1);`。
- 註解聚焦：**用途、輸入、輸出、流程、例外、注意事項**。
- 型別明確：優先 PHP 8+ 型別，必要時補 **PHPStan** 標記（如 `array<string,int>`、`list<int>`、`non-empty-string`）。
- 術語：參數、回傳、例外、檔案、資料夾、相依、交易、快取、時區。
- 產生順序固定，避免贅詞，避免中英夾雜。

## 類別／介面／Trait 註解

- 說明用途、責任邊界、主要協作對象與限制條件。

```php
/**
 * 用途：此類別在系統中的職責與適用情境。
 * 協作：關鍵協作（Repository／Service／Event 等）。
 * 限制：邊界條件（併發、交易一致性、權限假設）。
 */
final class UserService { /* ... */ }
```

## 屬性註解

- 說明型別與用途；必要時標註單位、格式、範圍。

```php
/** @var array<string,mixed> $profile 使用者額外資料，鍵為欄位名稱 */
private array $profile = [];
```

## 函式／方法 PHPDoc（順序固定）

1. 功能說明
2. 輸入：`@param` 一行一參數，含用途與限制
3. 輸出：`@return` 說明回傳值與條件
4. 例外：`@throws` 與觸發情境
5. 流程說明：以 1. 2. 3. 條列主要步驟
6. 注意事項／副作用：I/O、交易、快取、時區、外部相依
7. 相關參考：`@see`、`@link`（可選）

```php
/**
 * 使用者註冊
 *
 * 功能說明：建立新使用者並寄送驗證信。
 *
 * 輸入：
 * @param non-empty-string $email 使用者 Email（需唯一）
 * @param non-empty-string $password 雜湊前的密碼
 * @param array<string,mixed> $profile 額外資料（例如暱稱、時區）
 *
 * 輸出：
 * @return int 新建立的使用者 ID
 *
 * 例外：
 * @throws DomainException 當 Email 已存在
 * @throws RuntimeException 寄信服務失敗
 *
 * 流程說明：
 * 1. 驗證 Email 格式與是否重複。
 * 2. 產生雜湊密碼並建立使用者。
 * 3. 觸發寄送驗證信事件並回傳 ID。
 *
 * 注意事項：此操作會寫入資料庫並觸發外部郵件服務。
 * @see UserRepository::create()
 */
public function register(string $email, string $password, array $profile = []): int
{
    // 流程步驟 1：驗證輸入（格式、唯一性）
    // 流程步驟 2：雜湊密碼與建模
    // 流程步驟 3：持久化並觸發郵件事件
}
```

## 檔案層級註解（可選）

- 在檔案開頭補充本檔用途與關聯模組。

```php
<?php
declare(strict_types=1);

/**
 * 檔案用途：說明此檔案內類別或功能的主要目的與使用場景。
 * 相關模組：可列出關聯服務、Repository、第三方套件。
 */
```

## 區塊與流程註解

- 主要邏輯區塊前加單行註解，說明「做什麼＋為什麼」。
- 需決策理由時，補充關鍵假設與權衡。

```php
// 為降低撞庫風險，使用 Argon2id 雜湊演算法
```

## 型別與領域約定

- 金額：使用「整數分」或 Decimal 字串，註明單位。
- 時間：ISO 8601 或 `DateTimeImmutable`，註明時區假設。
- ID：註明來源與唯一性（資料庫自增、UUIDv7 等）。
- 集合型別：以 PHPStan 標記精確化（`array<int,User>`、`non-empty-list<string>`）。

## 例外處理

- 明列可能例外與觸發條件；吞例外時寫明理由與補救機制。
- 對外 I/O 失敗需回報可觀測訊息或事件。

## 禁止事項

- 不得留空的 `@param`、`@return`、`@throws`。
- 不得以「如上」或「略」帶過用途或流程。
- 不得以英文縮寫取代中文說明（除非為業界標準名詞）。

## Copilot 產出規則（行為）

- 每次新增或修改函式，**自動補齊**上述 PHPDoc 與必要流程註解。
- 一律使用繁體中文（台灣用語），維持固定欄位順序。
- 無法判斷型別時，給出保守且可讀的 PHPStan 型別並註記假設。

## 審查清單（提交前自檢）

- [ ] 是否使用繁體中文（台灣）且欄位順序正確？
- [ ] `@param` 是否逐一說明用途與限制？
- [ ] `@return` 是否可判斷邊界條件與錯誤分支？
- [ ] `@throws` 是否覆蓋可見的失敗情境？
- [ ] 是否描述主要流程與副作用（I/O、交易、快取、時區）？
- [ ] 是否標註必要的單位、時區、唯一性假設？
- [ ] 是否補充關鍵決策的假設與權衡？
- [ ] 是否避免空白或無意義的註解？
- [ ] 是否避免中英夾雜與不當縮寫？
