FactoryBot.define do
  factory :purchase do
    token                 {"tok_abcdefghijk00000000000000000"}
    postal_code           {"111-1111"}
    prefecture_id         {2}
    municipalities        {"千代田区"}
    house_number          {"丸の内３丁目3−１"}
    building              {"新東京ビル４F"}
    phone_number          {"01234567890"}
  end
end