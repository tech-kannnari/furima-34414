require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品登録' do
    context '新規出品登録できるとき' do
      it 'image,name,description,category_id,item_status_id,delivery_fee_id,delivery_area_id,delivery_day_id,price,userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品登録できないとき' do
      it 'imageが存在しない時登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが存在しない時登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが存在しない時登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが存在しない時登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが--の時登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択して下さい')
      end

      it 'item_status_idが存在しない時登録できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'item_status_idが--の時登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status を選択して下さい')
      end

      it 'delivery_fee_idが存在しない時登録できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it 'delivery_fee_idが--の時登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee を選択して下さい')
      end

      it 'delivery_area_idが存在しない時登録できない' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it 'delivery_area_idが--の時登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area を選択して下さい')
      end

      it 'delivery_day_idが存在しない時登録できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'delivery_day_idが--の時登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day を選択して下さい')
      end

      it 'priceが存在しない時登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には300~9999999の半角英数字を入力してください')
      end

      it '[price < 300]の時登録できない' do
        @item.price = 280
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には300~9999999の半角英数字を入力してください')
      end
      it '[price > 9,999,999]の時登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には300~9999999の半角英数字を入力してください')
      end

      it 'priceが半角数字以外の時登録できない' do
        @item.price = '４０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price には300~9999999の半角英数字を入力してください')
      end
    end
  end
end
