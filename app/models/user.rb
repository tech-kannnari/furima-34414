class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  # validates :email, uniqueness: true ← こちらはuserのmigrateファイル内にデフォルトでバリデイトされているので記述はいらない
  with_options presence: true do
    
    validates :nickname
    validates :birthday
    
    with_options format: {
      with: /\A[ぁ-んァ-ン一-龥々]+\z/,
      message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" } do
      validates :last_name
      validates :name
    end
    
    with_options format: {
      with: /\A[ァ-ヶー－]+\z/,
      message: "全角カタカナのみで入力して下さい" } do
      validates :last_kana 
      validates :kana
    end
    
    validates :password, 
      format: {
      with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,20}\z/,
      message: "には半角英字と数字の両方を含めて6文字以上で設定してください"
      }
  end
end



