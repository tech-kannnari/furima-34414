class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :histories

  validates :email, uniqueness: true
  validates :nickname, presence:true
  validates :last_name, presence:true
  validates :name, presence:true
  validates :last_kana, presence:true
  validates :kana, presence:true
  validates :birthday, presence:true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
