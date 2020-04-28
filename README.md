# README

## users
|Column|Type|Options|
|------|----|-------|
|mail|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|nick_name|string|null: false|
### Association
- has_many   :groups, through: group_users
- has_many   :group_users
- belongs_to :expense

## groups
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|string|null: false|
|icon|string|mount_uploader: group_icon|
### Association
- has_one  :group_icon
- has_many :users, through: group_users
- has_many :group_users
- has_many :expenses
- has_many :tasks

## group_icons
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :group

## group_users
|Column|Type|Options|
|------|----|-------|
|group_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## expenses
|Column|Type|Options|
|------|----|-------|
|order_date|date|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|content|string|null: false|
|income_spend|integer|null: false|
|price|integer|null: false|
|remarks|text|
|receipt_file_name|string|
|receipt_file|string|mount_uploader: exceipt|
|account_id|integer|null: false|
|group_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- has_one    :receipt_file
- belongs_to :group
- belongs_to :user
### Active_hash(income_spend)
- 0:借方
- 1:貸方
### Active_hash(account_id)
- 勘定科目(項目分け)

## receipt_files
|Column|Type|Options|
|------|----|-------|
|file|string|
|expense_id|references|null: false, foreign_key: true|
### Association
- belongs_to :expense

## tasks
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|client_user|string|null: false|
|client_name|string|null: false|
|detail|text|null: false|
|request_date|date|null: false|
|delivery_date|date|null: false|
|status|integer|default: 1|
|group_id|references|null: false, foreign_key: true|
### Association
- belongs_to :group
### Active_hash(status)
- 1:未着手
- 2:要件整理
- 3:作成中
- 4:確認待
- 5:完了
- 9:取消・キャンセル