
# WHALE DONE

人性化 CRM 平台

## 說明

以下的說明將為您提供該項目的一個副本，讓您的本地電腦上運行以利於開發和測試目的。


## 基本條件

您的電腦至少需要有這些軟體

* 檢視網頁用的 Chrome 瀏覽器
* Terminal
* 文字編輯器。例如：Sublime Text 


## 安裝

您也許需要安裝這些軟體

* Homebrew
* Ruby
* Rails

## 如何開始

下載後, 需要在 config/email.yml 設置
```
development:
  address: "smtp.gmail.com"
  port: 587
  domain: "gmail.com"
  authentication: "plain"
  user_name: "your_user_name"
  password: "your_password"
  enable_starttls_auto: true
```
然後

1. Run `bundle install`
2. Run `rails db:migrate`
3. Run `rails db:seed`


## 建置

- Rails '~> 5.1.5'
- Bootstrap3


## 分支協作圖

[GitHub Branch](https://github.com/beranemo/whale/network)

## 撰碼風格

參照此[連結](https://github.com/github/rubocop-github/blob/master/STYLEGUIDE.md)


## 螢幕截圖

<img src="https://github.com/beranemo/whale/blob/master/app/assets/images/readme.png" width="100%">

## 核心使用者故事

- 當客戶結帳時，門市人員可以輸入訂單記錄
- 門市人員可以追蹤銷售記錄
- 門市人員可以管理商品項目



## 完整使用者故事

### 使用者身份
- 客戶 (顧客)
- 門市人員 ( 業務人員／門市主管 )
- 管理員 ( 系統本身設置 )


### 系統功能

- 管理員能新增門市人員帳號
- 門市人員可使用門市人員帳號在登錄頁面登入系統
  - 門市人員登入後可以修改密碼及修改顯示在系統的名稱
- 管理員可以查詢所有會員資料
  - 可以對會員資料做修改
- 門市人員可以查詢所有會員資料
  - 可以對會員資料做修改
- 管理員可以查詢訂單資料
  - 可以對訂單資料做修改
- 門市人員可以查詢訂單資料
  - 可以對自己所建立的訂單資料做修改
- 管理員可以查詢目前門市人員資料
  - 對於已離職門市人員、可以轉換為已離職
- 管理員可以匯出會員資料 ( CSV檔 )
- 管理員可以匯入會員資料 ( EXCEL檔 )
- 門市人員可以記錄今日工作日誌
  - 門市人員只能對自己新增的日誌修改及刪除


### 客情紀錄

- 門市人員可以填寫客情記錄
  - 客情記錄能記錄客戶的購買金額、性別、類型、國籍、年齡結購、如何得知、備註
  - 新增客情記錄時系統會自動代入新增時間以及記錄人員
    - 只有該筆客情記錄的記錄人員可以修改及刪除當筆記錄
- 門市人員可以快速看到今日客情
- 門市人員可以依日期起迄範圍找到客情資料
- 門市人員可以看今日客情分析報表


### 會員管理

- 客戶可以現場使用 PAD 自行加入會員
  - 填寫欄位有：姓名、性別、生日、手機號碼、電子信箱、地址、髮質、膚質、傳真 、如何得知
- 門市人員也可以幫客戶創建會員資料
  - 填寫欄位有：姓名、性別、生日、手機號碼、電子信箱、地址、髮質、膚質、傳真、如何得知、會員群組、備註
  - 多出備註欄位（內部使用欄位），門市人員可以建立客戶喜好項目
  - 多出會員群組欄位（內部使用欄位），門市人員可以分類客戶
- 門市人員也可以幫客戶過往消費訂單紀錄歸戶
  - 在幫客戶建立會員資料，假設客戶有消費，也可以把訂單記錄歸戶         
- 若客戶已是會員，門市人員可以用手機號碼、email 、姓名搜尋會員資料
  - 可由查詢到的會員資料成立訂單
  - 可由查詢到的會員資料查看歷史訂單記錄
  - 可由查詢到的會員資料查看會員詳細資料
    - 若會員資料有更新，可以進行編輯
  - 會員資料頁面會有當月壽星提醒
- 門市人員可以查詢當月壽星清單
  - 可查看當月壽星會員的歷史訂單記錄
  - 可查看當月壽星會員的會員詳細資料
- 門市人員可以查到會員的歷史訂單


### 最新活動(打折優惠, 最新消息, 公布欄, 每日必看)

- 門市人員可以建置、修改、刪除活動消息起始日期,結束日期,活動標題, 活動內容
  - 門市人員只能對自己新增的活動消息修改及刪除


### 銷售紀錄(訂單處理)

- 當客戶結帳時，門市人員可以輸入訂單記錄
  - 當客戶為會員時，可以快速搜尋該會員資料並帶入訂單
    - 可利用模糊搜尋功能藉由姓名、手機、email 快速搜尋該會員
  - 門市人員可以使用 barcode scanner 快速掃入商品
  - 門市人員也可以使用商品列表快速加入購買商品
    - 商品的折扣方式有優惠價、贈品、打折、第二件半價，預設為無
      1. 若選擇折扣方式為優惠價，為跳出一彈跳視窗請門市人員自行輸入折扣後價錢
      2. 若選擇折扣方式為贈品，則價錢自動變為0元
      3. 若選擇折扣方式為打折，為跳出一彈跳視窗請門市人員輸入折扣%
          - 輸入折數百分比為1-100的數字。例如：打9折請輸入90
      4. 若選擇折扣方式為第二件半價，那麼買兩件會有一件算半價
          - 買三件也是一件算半價，買四件跟五件則有兩件算半價，以此類推
    - 整筆訂單的折扣方式有使用折價卷、輸入折扣％
      1. 若選擇折扣方式為使用折價卷，則輸入折價金額
      2. 若選擇折扣方式為輸入折扣％，則輸入折數百分比為1-100的數字。例如：打9折請輸入90
  - 一筆訂單記錄，裡面包含很多商品品項（A品項、B品項、C品項等等）
  - 當這筆訂單記錄儲存成功時，相對扣除庫存數量
    - 若訂單狀態為預購則不扣門市數量
    - 若取貨方式為宅配則不扣門市數量
  - 這筆訂單記錄，可以註記首購／回購(系統判斷)
  - 這筆訂單記錄，可以註記客戶身份為會員／路人(系統判斷)
    - 如果是會員的話，可以直接把訂單記錄歸戶
    - 在歸戶時，如果是當月壽星，會看到壽星註記
  - 這筆訂單記錄，可以註記訂單狀態為現取／預購
    - 若為預購，可以貨到時現場取貨，或者貨到時宅配
    - 若為預購，會有單一頁面紀錄預購訂單，呈現未領取狀態
      1. 門市人員可以修改訂單狀態從預購轉為現貨，則訂單狀態可以從未領取變為已領取
  - 這筆訂單記錄，可以註記取貨方式為自取／宅配
    - 如果是宅配的話，門市人員可以點擊發信通知倉庫，即把客戶訂單資料發信箱通知倉庫
      1. 客戶訂單資料即包含客戶基本資料(會員／路人)和訂單明細
      2. 宅配對象可以是會員／路人 
      3. 如果是宅配的話，不扣門市庫存數量，商品由倉庫出貨
  - 這筆訂單記錄，可以註記付款方式為現金／刷卡／其他
    - 若為其他，可自行輸入付款方式內容
  - 訂單要有隔日帳功能
    - 門市人員可由編輯訂單更改訂單成立時間
- 當訂單成立時，門市人員可以建立客情頁面
  - 若客戶為會員時，自動帶入會員資料並建立客情
- 門市人員可以輸入起迄日期查詢特定時段的訂單清單
  - 門市人員可以藉由查詢到的訂單記錄填寫客情記錄
  - 門市人員可以藉由查詢到的訂單記錄進行會員歸戶
    - 由編輯訂單，進到成立訂單頁面，搜尋到欲歸戶會員後帶入
- 門市人員可以看到這筆訂單明細
  - 點選訂單流水號可看到訂單明細
- 門市人員可以由訂單記錄看到是否首購
  - 只要訂單記錄不是首購的，即屬於再次回購


### 後台系統(維護設定)

- 人員可以對系統擴充需要的項目
  - 膚質維護檔
  - 髮質維護檔
  - 會員群組維護檔
  - 客戶類型維護檔
  - 年齡結構維護檔
  - 消息得知途徑維護檔
  - 國家維護檔（系統既定，無法新增項目）
  - 商品類型維護（系統既定，無法新增項目）
備註：所有維護檔資料一旦建立不建議刪除及編輯，以免資料無法關連


### 帳務與會員報表(報表分析)

- 門市人員可輸入日期查到每日銷售明細
  - 門市人員可看到總銷售金額和每筆訂單的購買商品進行當日對帳
  - 門市人員可點選訂單流水號即可看到明細
- 門市人員可輸入起訖日期查到特定時段的銷售報表
  - 門市人員可點選訂單流水號即可看到明細
  - 門市人員可看到總銷售金額
- 門市人員可以看客單價
  - 客單價：業績（一百萬）除以訂單數（一百筆）
- 門市人員可以看銷售排行
  - 門市人員可看到本月門市人員銷售排行
  - 門市人員可看到今日整點銷售情況
  - 門市人員可由日期銷售輸入起迄日期查到銷售金額與銷售數量
  - 門市人員可看到本月銷售熱門品項排行


### 商品管理(庫存系統)
- 門市人員可以利用 excel 匯入來建立商品項目
  - 門市人員可以利用 excel 再次上傳來整批修改內容
  - 再次上傳 excel，會對除了國際條碼欄位做更新動作，而數量欄位則是累加
- 門市人員可以單獨新增商品項目
- 門市人員可以編輯商品項目
- 門市人員可以查詢現有庫存
- 門市人員可以進貨／退貨管理
  - 門市人員可以在系統上面整批輸入完進退貨數量後再一次送出
- 門市人員可以停用商品
  - 被停用的商品不會出現在銷售商品中
- 商品數量低於庫存量顯示警示(目前設定數量5)
- 門市人員可以瀏覽商品詳細說明


## 作者

- 雜七雜八打雜 Yipeechen
- 等我打完爐石 spy1031
- 只會出一張嘴 beranemo
