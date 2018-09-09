# spec/factories/investor.rb
FactoryBot.define do
    factory :investor do
        sequence(:company) { |n| "#{Faker::Lorem.word}-#{n}"}
    end
end