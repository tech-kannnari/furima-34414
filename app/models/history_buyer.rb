class HistoryBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipalities, :address, :building, :phone_number, :history, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :building
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "can't be blank"}
  end
  validates :delivery_area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, history: history)
  end
end