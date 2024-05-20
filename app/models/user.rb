class User < ApplicationRecord
  has_many :items
  has_many :records



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :birthday, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :next_last_name, presence: true
         validates :next_first_name, presence: true

end
