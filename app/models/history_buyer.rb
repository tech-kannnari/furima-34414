class HistoryBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipalities, :address, :building, :phone_number, :history, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は-を含む半角数字で入力してください"}
    validates :delivery_area_id, numericality: {other_than: 1, message: "を選択して下さい"}
    validates :municipalities
    validates :address
    validates :building
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/, message: "半角数字10~11文字以内で入力してください"}
  end

  
  
  
  def save
    history = History.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, history: history)
  end
end