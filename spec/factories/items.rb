FactoryBot.define do
  factory :item do
    item_name             {"a"}
    text                  {"a"}
    category_id           {2}
    condition_id          {2}
    delivery_fee_id       {2}
    prefecture_id         {2}
    duration_id           {2}
    amount                {1000}
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

