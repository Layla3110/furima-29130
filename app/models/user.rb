class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :encrypted_password,:password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :surname, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :firstname, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :surname_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "surname_kana Full-width katakana characters"}
    validates :firstname_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "firstname_kana kana Full-width katakana characters"}
    validates :birthdata
   end
end
