class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :birthdata
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: "Full-width characters"} do
    validates :surname
    validates :firstname
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"} do
    validates :surname_kana
    validates :firstname_kana
  end

  has_many :items
  has_many :purchase_histories
end