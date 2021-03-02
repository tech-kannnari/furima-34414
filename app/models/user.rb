class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :histories

  # validates :email, uniqueness: true ← こちらはuserのmigrateファイル内にデフォルトでバリデイトされているので記述はいらない
  with_options presence: true do

    validates :nickname
    
    validates :last_name, format: {
      with: /\A[ぁ-んァ-ン一-龥々]+\z/,
      message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい"
    }
    validates :name,format: {
      with: /\A[ぁ-んァ-ン一-龥々]+\z/,
      message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい"
    }
    validates :last_kana, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: "全角カタカナのみで入力して下さい"
    }
    validates :kana, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: "全角カタカナのみで入力して下さい"
    }
    validates :birthday

    validates :password, 
      format: {
      with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,20}\z/,
      message: "には半角英字と数字の両方を含めて6文字以上で設定してください"
      }
  end


end



