class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'Include both letters and numbers' }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'full-width characters'} do
      validates :first_name_kanji 
      validates :last_name_kanji
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'full-width katakana characters'} do
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
