require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,last_name,name,last_kana,kana,birthdayが存在すれば登録できる' do
        # user = build(:user)
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordに半角英語が入らないと登録できない' do
        @user.password = '00000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordに数字が入らないと登録できない' do
        @user.password = 'iiiiiiii'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end  
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'kanaが空では登録できない' do
        @user.kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana can't be blank")
      end
      it 'last_nameが半角文字だと登録できない' do
        @user.last_name = 'kiki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end

      it 'nameが半角文字だと登録できない' do
        @user.name = 'kiki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name は全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end

      it 'last_kanaが全角文字カナ以外だと登録できない' do
        @user.last_kana = 'kiki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナのみで入力して下さい")
      end

      it 'kanaが全角文字カナ以外だと登録できない' do
        @user.kana = 'kiki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana 全角カタカナのみで入力して下さい")
      end
    end

  end
end

