class Item < ApplicationRecord
  
  belongs_to :user

  with_options presence: true do
    validates :image, has_one_attached: 
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_day_id 
    validates :price
  end

end
