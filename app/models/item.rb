class Item < ApplicationRecord
  
  belongs_to :user
  has_one    :history
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
    validates :image

    with_options numericality: { other_than: 1, message: "を選択して下さい"} do
      validates :category_id
      validates :item_status_id
      validates :delivery_fee_id
      validates :delivery_area_id
      validates :delivery_day_id 
    end
  end
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000, 
    message: "には300~9999999の半角英数字を入力してください"}
end




