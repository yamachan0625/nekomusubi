# NEKOMIKKE

## 使用画面サンプル

<img width="722" alt="スクリーンショット 2020-01-01 1 26 16" src="https://user-images.githubusercontent.com/55592297/72965617-2d59bf80-3e00-11ea-968c-ad0ac59bd13d.png">

<img width="310" alt="スクリーンショット 2020-01-01 1 37 31" src="https://user-images.githubusercontent.com/55592297/72966148-8118d880-3e01-11ea-8fe6-82210faed2c5.png">

<img width="1440" alt="スクリーンショット 2020-01-27 0 07 03" src="https://user-images.githubusercontent.com/55592297/73137219-31ecd500-4099-11ea-88a5-0d82e021edc4.png">

<img width="1440" alt="スクリーンショット 2020-01-23 17 09 00" src="https://user-images.githubusercontent.com/55592297/72966818-27b1a900-3e03-11ea-82c3-f70039b9b936.png">

<img width="1440" alt="スクリーンショット 2020-01-23 17 04 17" src="https://user-images.githubusercontent.com/55592297/72966526-8296d080-3e02-11ea-8339-e4b8c9b0fe6d.png">


<img width="1440" alt="スクリーンショット 2020-01-23 17 00 26" src="https://user-images.githubusercontent.com/55592297/72966437-54b18c00-3e02-11ea-9a97-e7594202ba82.png">

<img width="1440" alt="スクリーンショット 2020-01-23 17 03 16" src="https://user-images.githubusercontent.com/55592297/72966440-567b4f80-3e02-11ea-9aa3-8ad140f9b8ac.png">



## リンク
https://nekomikke.com

## テストユーザー
かんたんログインにてログイン可能

## アプリ制作背景
私の母親は運転中、道で倒れている猫を見つけると車から降り猫を道の端に寄せ、保健所に連絡し、自分の罪のように悲しむ優しい人です。その母を見て育った私は恵まれない猫を一匹でも多く助けたいと強く思っています。  
そこで作成したのがNEKOMIKKEというアプリです。恵まれない捨て猫を位置情報と共にシェアし近隣の人に救助依頼を出すという流れです。保護したいがマンションで飼うことができない、猫アレルギーであるなどの理由で見捨てるしかなかった人にも救うチャンスを与えることができます。


## アプリ概要
捨て猫を見つけたら、画像、詳細、現在の位置情報と共に登録しシェアできるSNSです。  
都道府県や地名などから検索することも可能です。  
登録された捨て猫はグーグルマップにマーカーで一覧表示されます。  
表示されたマーカーをクリックすると登録内容が表示され、グーグルマップでの検索、詳細ページへの遷移が可能です。  
登録したユーザーにDMを送ることが可能です。  
登録から１週間経つと危険信号として背景が赤くなり、画像が揺れます。一ヶ月経つと自動的に登録内容が削除されます。
　　
   
## 実装機能
・アカウント認証機能（devise）  
・ログイン機能（メールアドレス,twitter,facebook,google） 
・かんたんログイン機能
・投稿のCURD機能（一覧、新規作成、編集、削除）  
・画像のアップロード機能（CarrierWave） 
・投稿の詳細表示機能  
・投稿の検索機能  
・投稿一覧のページネーション（kaminari）  
・投稿後一定時間経過によるビューの変化&削除機能  
・SNSシェア機能（twitter,facebook）  
・DM機能  
・グーグルマップ（現在地の住所&緯度経度取得,マーカー表示）  
・レスポンシブ対応   
・RSpec(単体テスト)  

## 使用技術
【フロントエンド】  
・HTML  
・CSS  
・javascript  
・jQuery  
・Google API  
　　- Maps JavaScript  
　　- Geolocation  

【バックエンド】  
・Ruby  
・Rails  
・RSpec  

【インフラ】  
・MySQL  
・AWS  
　　- EC2/ALB  
　　- S3  
　　- Route53  
　　- ACM  
　　- VPC  

## DB設計
![db](https://user-images.githubusercontent.com/55592297/72965119-db646a00-3dfe-11ea-87ce-6961d819eb47.jpg)

