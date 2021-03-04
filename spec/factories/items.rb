FactoryBot.define do

  factory :item do
      name              {Faker::Name}
      description       {Faker::Lorem}
      category_id       {2}
      item_status_id    {2}
      delivery_fee_id   {2}
      delivery_area_id  {2}
      delivery_day_id   {2}
      price             {10000}
      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/omuraisu.png'), filename: 'omuraisu.png')
      end
  end
end
