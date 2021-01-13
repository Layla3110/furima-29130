FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname               {"山田"}
    firstname             {"太郎"}
    surname_kana          {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birthdata             {"2020-01-09"}
  end
end
