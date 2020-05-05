# sequenceで連番を定義する

FactoryBot.define do
  factory :user do
    sequence(:nick_name) { |n| "User#{n}" }
    family_name { "User" }
    sequence(:first_name) { |n| "#{n}#{n}#{n}" }
    sequence(:email) { |n| "test_#{n}@gmail.com" }
    sequence(:password) { |n| "#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}" }
    sequence(:password_confirmation) { |n| "#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}" }

    # 以下のように書くと、上で定義しているuserに対して関連するgroupを生成してくれる
    # after(:create) do |user|
    #   create(:group, user: user)
    # end

  end
end