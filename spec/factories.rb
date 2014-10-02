FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name  "Last"
    sequence(:email) { |n| "user#{n}@odot.com" }
    password   "treehouse1"
    password_confirmation "treehouse1"
  end

  factory :todo_list do
    title "Todo List Title"
    description "Todo List Description"
    user
  end
end