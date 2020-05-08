require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前、メアド、パスワードがあれば有効であること
  it "is valid with a nick_name, family_name, first_name, email, and password" do
    @user = FactoryBot.create(:user)
    expect(@user).to be_valid
  end

  # ニックネームがなければ無効であること
  it "is invalid without a nick_name" do
    @user = FactoryBot.create(:user)
    @user.nick_name = nil
    @user.valid?
    expect(@user).to be_valid
  end

  # 苗字がなければ無効であること
  it "is invalid without a family_name" do
    @user = FactoryBot.create(:user)
    @user.family_name = nil
    @user.valid?
    expect(@user).to be_valid
  end

  # 性がなければ無効であること
  it "is invalid without a first_name" do
    @user = FactoryBot.create(:user)
    @user.first_name = nil
    @user.valid?
    expect(@user).to be_valid
  end

  # メアドがなければ無効であること
  it "is invalid without a email" do
    @user = FactoryBot.create(:user)
    @user.email = nil
    @user.valid?
    expect(@user.errors[:email]).to include("が入力されていません。")
  end

  # メアドが重複している場合は無効であること
  it "is invalid with a duplicate email address" do
    User.create(
      nick_name: "TEST001",
      family_name: "TEST",
      first_name: "001",
      email:      "test001@gmail.com",
      password:   "11111111"
    )

    @user = User.new(
      nick_name: "TEST111",
      family_name: "TEST",
      first_name: "111",
      email:      "test001@gmail.com",
      password:   "11111111"
    )

    @user.valid?
    expect(@user.valid?).to eq(false)
  end
end