# sequenceで連番を定義する
FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "test_group_#{n}" }

    user

    # create_listを用いると、関連する複数のtask/expenseを生成してくれる(ここでは各5つを生成)
    after(:create) do |group|
      create_list(:task, 5, group: group)
    end
    after(:create) do |group|
      create_list(:expense, 5, group: group)
    end
  end
end