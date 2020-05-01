class Group < ApplicationRecord
  mount_uploader  :icon       , GroupIconsUploader
  has_one         :group_icon
  has_many        :group_users, dependent: :destroy
  has_many        :users      , through:   :group_users
  has_many        :expenses   , dependent: :destroy
  has_many        :tasks      , dependent: :destroy
end
