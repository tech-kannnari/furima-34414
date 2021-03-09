class HistoryBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipalities, :address, :building, :phone_number, :history
end