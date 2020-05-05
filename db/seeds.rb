100.times do |n|
  nick_name = Faker::Games::Pokemon.name
  family_name = Faker::Name.middle_name
  first_name = Faker::Name.first_name
  email = "Faker_#{n}@gmail.com"
  password = "12121212"
  User.create!(nick_name: nick_name,
               family_name: family_name,
               first_name: first_name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end

10.times do |n|
  name = Faker::JapaneseMedia::OnePiece.location
  Group.create!(name: name,
                master_user: n + 1,
              )
end

10.times do |n|
  10.times do |i|
  userId = n * (i + 1) + (i + 1)
  GroupUser.create!(user_id: userId,
                    group_id: n + 1,
              )
  end
end

10.times do |n|
  groupID = n + 1
  10.times do |i|
    title = Faker::Coffee.blend_name
    client_user = Faker::Name.name
    client_name = Faker::Company.name
    detail = Faker::Coffee.notes
    request_date = Faker::Date.in_date_period(year: 2020, month: 5)
    delivery_date = Faker::Date.in_date_period(year: 2020, month: 6)
    Task.create!(title: title,
                 client_user: client_user,
                 client_name: client_name,
                 detail: detail,
                 request_date: request_date,
                 delivery_date: delivery_date,
                 status: 1,
                 group_id: groupID
                )
  end
end

10.times do |n|
  groupID = n + 1
  contentId = ("000" + (n + 1).to_s)[-3..-1]
  10.times do |i|
    order_date = Faker::Date.in_date_period(year: 2020)
    year = order_date.strftime("%Y")
    month = order_date.strftime("%m")
    day = order_date.strftime("%d")
    contentNumber = contentId + "_" + ("00" + (i +1).to_s)[-2..-1]
    content = "#{contentNumber}_" + Faker::Company.name
    income_spend = rand(2)
    price = rand(1000..100000)
    remarks = Faker::Company.industry
    receipt_file_name = "領収書_#{contentNumber}"
    account_id = rand(2)
    userId = n * (i + 1) + (i + 1)
  Expense.create!(order_date: order_date,
                  year: year,
                  month: month,
                  day: day,
                  content: content,
                  income_spend: income_spend,
                  price: price,
                  remarks: remarks,
                  receipt_file_name: receipt_file_name,
                  account_id: account_id,
                  group_id: groupID,
                  user_id: userId
              )
  end
end