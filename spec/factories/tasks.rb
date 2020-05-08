# sequenceで連番を定義する

FactoryBot.define do
  factory :task do
    title         { 'WordPress制作' }
    sequence(:client_user) { |n| "client_user_#{n}" }
    sequence(:client_name) { |n| "client_name_#{n}" }
    detail        { '企業用ランディングページのHP制作依頼' }
    request_date  { '2020/05/05' }
    delivery_date { '2020/05/31' }
    status        { '0' }

    group
  end
end