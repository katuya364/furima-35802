class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name_kanji, format: { with: /\A[一-龥々ぁ-ん]+\z/, message: 'full-width characters' }
    validates :last_name_kanji,  format: { with: /\A[一-龥々ぁ-ん]+\z/, message: 'full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'first_name_kana full-width katakana characters' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'last_name_kana full-width katakana characters' }
    validates :birthday
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'Include both letters and numbers' }
  end
end
