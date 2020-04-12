class Expense < ApplicationRecord
  mount_uploader :receipt_file, ReceiptFileUploader
  has_one    :receipt_file
  belongs_to :group
  belongs_to :user
end
