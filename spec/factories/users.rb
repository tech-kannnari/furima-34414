FactoryBot.define do
  factory :user do
    nickname              {"Tom"}
    email                 {Faker::Internet.email}
    password              {"000000o"}
    password_confirmation {"000000o"}
    last_name             {"佐藤"}
    name                  {"健"}
    last_kana             {"サトウ"}
    kana                  {"タケル"}
    birthday              {"1930-02-03"}
  end
end