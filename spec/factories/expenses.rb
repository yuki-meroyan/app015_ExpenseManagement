FactoryBot.define do
  factory :expense do
    order_date        { '2020/05/05' }
    year              { '2020' }
    month             { '05' }
    day               { '05' }
    content           { 'デスク購入' }
    income_spend      { '2' }
    price             { '100000' }
    remarks           { '作業用に購入' }
    receipt_file_name { '領収書_20200505' }
    receipt_file      { '' }
    account_id        { '1' }

    group
  end
end