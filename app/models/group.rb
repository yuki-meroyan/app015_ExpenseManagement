class Group < ApplicationRecord
  mount_uploader :icon        , GroupIconUploader
  has_one         :group_icon
  has_many        :group_users, dependent: :destroy
  has_many        :users      , through: :group_users
  has_many        :expenses
  has_many        :tasks
end
