class User < ApplicationRecord
  #has_many :items
  #has_many :records



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :birthday, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :next_last_name, presence: true
         validates :next_first_name, presence: true

         validates :next_last_name, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
         validates :next_first_name, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }

  validates :last_name, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角で入力してください" }
  validates :first_name, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角で入力してください" }

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字混合で入力してください" }

end
