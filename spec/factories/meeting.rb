# spec/factories/todo_list.rb
FactoryBot.define do
    factory :meeting do
      sequence(:time) { |n| "#{Faker::Lorem.word}-#{n}"}
    end
  end