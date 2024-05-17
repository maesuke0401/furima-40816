class User < ApplicationRecord
  has_many :items
  has_many :records



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         attribute :birthday, :date
         attribute :last_name, :string
         attribute :first_name, :string
         attribute :next_last_name, :string
         attribute :next_first_name, :string

end
