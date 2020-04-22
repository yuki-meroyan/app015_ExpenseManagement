class Expense < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :account

  mount_uploader :receipt_file, ReceiptFilesUploader
  has_one    :receipt_file
  belongs_to :group
  belongs_to :user
end
