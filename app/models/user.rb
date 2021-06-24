class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name_kanji, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: "full-width characters"}
  validates :last_name_kanji, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: "full-width characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "first_name_kana full-width katakana characters" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "last_name_kana full-width katakana characters" }
  validates :birthday, presence: true
  validates :password,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "Include both letters and numbers"}
end