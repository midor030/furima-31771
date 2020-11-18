class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :familyname_kanji, presence: true
  validates :firstname_kanji, presence: true
  validates :familyname_kana, presence: true
  validates :firstname_kana, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true
end
