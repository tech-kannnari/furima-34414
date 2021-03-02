class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

end



