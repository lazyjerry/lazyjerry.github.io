---
applyTo: "**/*.php"
description: "Copilot 在 PHP 檔自動產生繁中（台灣）PHPDoc、流程與用途註解之規範（適用 PHP 5.6–7.3；CodeIgniter 3.x、Laravel 5.x）"
---

# PHP 註解與 PHPDoc 指南（Legacy：PHP < 8）

目的：要求 GitHub Copilot 在你完成或修改 **PHP 5.6–7.3** 的程式碼後，自動產生高品質註解與 **PHPDoc**（繁體中文／台灣用語），清楚說明用途、輸入、輸出、流程、例外與副作用。適用 **CodeIgniter 3.x** 與 **Laravel 5.x** 專案。

> 強制原則：此規範**僅允許新增、調整、整理註解**，**禁止**更動或新增任何可執行程式碼。若遇到疑慮或可能錯誤的程式碼，請以 `// FIXME:` 或 `// TODO:` 前綴標註。

---

## 1) 通用原則（舊版 PHP 相容）

- **程式碼風格**：採 **PSR-2**（檔案開頭不得加入 `declare(strict_types=1);`）。
- **型別限制**：
  - **不得**使用標量型別提示（如 `string $x`、`int $n`）與**回傳型別宣告**（如 `: array`）。
  - **不得**使用型別屬性（Typed Properties）。
  - 允許傳統型別提示：`array`、`callable`、`\Foo\Bar` 類別型別。
- **以 PHPDoc 補足型別**：使用 PHPDoc（含 PHPStan 友善標記，如 `array<string,int>`、`non-empty-string`）。
- **術語一致**：參數、回傳、例外、檔案、資料夾、相依、交易、快取、時區、副作用。
- **輸出順序固定**：用途 → 輸入 → 輸出 → 例外 → 流程 → 注意事項 → 參考。

---

## 2) 類別／介面／Trait 註解

> 描述責任邊界、主要協作、限制條件。

```php
/**
 * 用途：此類別在系統中的職責與適用情境。
 * 協作：關鍵協作（Repository／Service／Event 等）。
 * 限制：邊界條件（併發、交易一致性、權限假設）。
 */
class UserService { /* ... */ }
```

> 對於 **CodeIgniter 3** 自訂 Library/Model，請在類別註解中標示與 `$this->load`、`$this->db` 的耦合與版本需求。

---

## 3) 屬性註解（PHP 5.x 無型別屬性）

> 一律使用 `@var` 標示實際型別、單位或格式；必要時標註範圍與鍵值。

```php
/** @var array<string,mixed> 使用者額外資料（鍵為欄位名稱） */
protected $profile = [];

/** @var non-empty-string 使用者電子郵件 */
private $email;
```

---

## 4) 函式／方法 PHPDoc（順序固定）

1. 功能說明（用途與邏輯定位）
2. 輸入：`@param` 一行一參數，含用途與限制
3. 輸出：`@return` 說明回傳值與條件
4. 例外：`@throws` 與觸發情境
5. 流程說明：以 1. 2. 3. 條列主要步驟
6. 注意事項／副作用：I/O、交易、快取、時區、外部相依
7. 相關參考：`@see`、`@link`（可選）

> **注意**：因不使用標量型別提示與回傳型別，`@param` 與 `@return` 必填且需**精確型別**。

```php
/**
 * 使用者註冊
 *
 * 功能說明：建立新使用者並寄送驗證信。
 *
 * 輸入：
 * @param non-empty-string $email 使用者 Email（需唯一）
 * @param non-empty-string $password 明文密碼（將於流程中雜湊）
 * @param array<string,mixed> $profile 額外資料（例如暱稱、時區）
 *
 * 輸出：
 * @return int 新建立的使用者 ID
 *
 * 例外：
 * @throws InvalidArgumentException 當 Email 格式無效
 * @throws DomainException 當 Email 已存在
 * @throws RuntimeException 寄信服務失敗
 *
 * 流程說明：
 * 1. 驗證 Email 格式與唯一性。
 * 2. 雜湊密碼並建立使用者。
 * 3. 觸發寄送驗證信並回傳 ID。
 *
 * 注意事項：此操作會寫入資料庫並觸發外部郵件服務。
 * @see UserRepository::create()
 */
public function register($email, $password, array $profile = [])
{
    // 流程步驟 1：驗證輸入（格式、唯一性）
    // 流程步驟 2：雜湊密碼與建模
    // 流程步驟 3：持久化並觸發郵件事件
}
```

---

## 5) 檔案層級註解（可選）

> 在檔案開頭補充本檔用途與關聯模組；Laravel 5 請同時標註此檔對 Service Container 或 Facade 的相依。

```php
<?php
/**
 * 檔案用途：說明此檔案內類別或功能的主要目的與使用場景。
 * 相關模組：可列出關聯服務、Repository、第三方套件。
 */
```

---

## 6) 區塊與流程註解

- 主要邏輯區塊前加單行註解，說明「做什麼＋為什麼」。
- 需決策理由時，補充關鍵假設與權衡。

```php
// 為降低撞庫風險，使用較慢但更安全的雜湊參數設定
```

---

## 7) 型別與領域約定

- **金額**：使用「整數分」或 Decimal 字串，註明單位。
- **時間**：ISO 8601 或 `DateTimeImmutable`，註明時區假設；CI3/L5 中請註明是否使用框架時區設定。
- **ID**：註明來源與唯一性（資料庫自增、UUIDv4/v7 等）。
- **集合**：以 PHPDoc 精確化（`array<int,User>`、`non-empty-list<string>`）。

---

## 8) 例外處理

- 明列可能例外與觸發條件；吞例外時**寫明理由**與補救機制。
- 外部 I/O 失敗需回報**可觀測訊息**或事件（例如記錄錯誤碼與相依服務）。

---

## 9) 框架特例與建議寫法

### 9.1 CodeIgniter 3.x

- **Loader 相依**：
  - 於類別註解標註與 `$this->load`、`$this->db`、`$this->input` 的依賴。
  - 使用 `@property` 標註 CI Magic Properties 以利 IDE 與 Copilot 推斷：

```php
/**
 * @property CI_Input   $input
 * @property CI_Loader  $load
 * @property CI_DB_query_builder $db
 */
class Users extends CI_Controller {
    /**
     * 建立使用者（CI3 Controller 範例）
     *
     * @return void
     */
    public function create()
    {
        // FIXME: 驗證尚未完成，需加入 CSRF 與表單驗證
        $email = $this->input->post('email', true);
        $password = $this->input->post('password', true);
        // TODO: 呼叫 Service 層處理商業邏輯
    }
}
```

### 9.2 Laravel 5.x

- **Eloquent Model**：利用 `@property`、`@property-read`、`@method` 提升推斷能力；避免在 Model 方法上使用回傳型別宣告。

```php
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

/**
 * Class User
 *
 * @property int $id
 * @property string $email
 * @property string $name
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @method static Builder whereEmail($value)
 */
class User extends Model {
    /**
     * 依 Email 取得使用者
     *
     * @param non-empty-string $email 查詢目標
     * @return User|null 找到則回傳 Model，否則 null
     */
    public static function byEmail($email)
    {
        return static::where('email', $email)->first();
    }
}
```

---

## 10) 禁止事項

- 不得留空的 `@param`、`@return`、`@throws`。
- 不得以「如上」或「略」帶過用途或流程。
- 不得以英文縮寫取代中文說明（除非為業界標準名詞）。
- 不得新增或修改**任何可執行程式碼**（僅能新增或整理註解）。

---

## 11) Copilot 產出規則（行為）

- 每次新增或修改函式，**自動補齊**上述 PHPDoc 與必要流程註解。
- 一律使用繁體中文（台灣用語），維持固定欄位順序。
- 無法判斷型別時，給出保守且可讀的 PHPDoc 型別並標註假設。
- 對可疑程式碼以 `// FIXME:` 或 `// TODO:` 前綴提出修正建議，**不得動到程式本體**。

---

## 12) 審查清單（提交前自檢）

- [ ] 是否使用繁體中文（台灣）且欄位順序正確？
- [ ] `@param` 是否逐一說明用途與限制？
- [ ] `@return` 是否清楚定義回傳與邊界條件？
- [ ] `@throws` 是否覆蓋可見的失敗情境？
- [ ] 是否描述主要流程與副作用（I/O、交易、快取、時區）？
- [ ] 是否標註必要的單位、時區、唯一性假設？
- [ ] 是否補充關鍵決策的假設與權衡？
- [ ] 是否避免空白或無意義的註解？
- [ ] 是否避免中英夾雜與不當縮寫？
- [ ] 是否未更動任何可執行程式碼？

---

## 13) 常用 PHPDoc 範本（可貼上使用）

```php
/**
 * 功能說明：<一句話描述用途>
 *
 * 輸入：
 * @param <type> $arg1 <用途與限制>
 * @param <type> $arg2 <用途與限制>
 *
 * 輸出：
 * @return <type> <回傳與條件>
 *
 * 例外：
 * @throws <Exception> <觸發情境>
 *
 * 流程說明：
 * 1. <步驟一>
 * 2. <步驟二>
 * 3. <步驟三>
 *
 * 注意事項：<I/O、交易、快取、時區、外部相依>
 */
function doSomething($arg1, $arg2)
{
    // TODO: 補上輸入驗證與邊界條件處理
}
```

