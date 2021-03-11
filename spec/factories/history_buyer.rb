FactoryBot.define do
  factory :history_buyer do
    token            {"tok_abcdefghijk00000000000000000"}
    postal_code      {"000-0000"}
    delivery_area_id {2}
    municipalities   {"仙台市"}
    address          {"中央"}
    building         {"メゾン"}
    phone_number     {"0000000000"}
    history          {2}
    user             {2}
  end
end