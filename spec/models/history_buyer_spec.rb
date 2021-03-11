require 'rails_helper'

RSpec.describe HistoryBuyer, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @history_buyer = FactoryBot.build(:history_buyer, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@history_buyer).to be_valid
    end

    it 'tokenが空では保存できないこと' do
      @history_buyer.token = nil
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では保存できないこと' do
      @history_buyer.postal_code = ''
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角数字でないと保存できないこと' do
      @history_buyer.postal_code = '０００-００００'
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include('Postal code は-を含む半角数字で入力してください')
    end

    it 'postal_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
      @history_buyer.postal_code = 0o000000
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include('Postal code は-を含む半角数字で入力してください')
    end

    it 'delivery_area_idを選択していないと保存できないこと' do
      @history_buyer.delivery_area_id = nil
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include("Delivery area can't be blank")
    end

    it 'delivery_area_idが--の時は保存できないこと' do
      @history_buyer.delivery_area_id = 1
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include('Delivery area を選択して下さい')
    end

    it 'municipalitiesは空では保存できないこと' do
      @history_buyer.municipalities = ''
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include("Municipalities can't be blank")
    end

    it 'addressは空では保存できないこと' do
      @history_buyer.address = ''
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include("Address can't be blank")
    end

    it 'buildingは空では保存できないこと' do
      @history_buyer.building = ''
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include("Building can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @history_buyer.phone_number = ''
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberは半角数字でなければ保存できないこと' do
      @history_buyer.phone_number = '００００００００００'
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include('Phone number 半角数字10~11文字以内で入力してください')
    end

    it 'phone_numberは11文字以内でなければ保存できないこと' do
      @history_buyer.phone_number = 0o000000000000
      @history_buyer.valid?
      expect(@history_buyer.errors.full_messages).to include('Phone number 半角数字10~11文字以内で入力してください')
    end
  end
end
