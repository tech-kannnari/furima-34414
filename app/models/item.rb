class Item < ApplicationRecord
  
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :item_status
    belongs_to :delivery_fee
    belongs_to :delivery_area
    belongs_to :delivery_day 

  with_options presence: true do
    validates :name
    validates :description

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :delivery_fee_id
      validates :delivery_area_id
      validates :delivery_day_id 
    end
    validates :price, format: with: numericality: 
    { only_integer: true, greater_than: 300, less_than: 9999999 }
  end
end




