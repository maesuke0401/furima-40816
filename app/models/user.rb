class User < ApplicationRecord
  #has_many :items
  #has_many :records



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :birthday, presence: true

         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
         validates :last_name, presence: true
         validates :first_name, presence: true
         end

         with_options presence: true, format:{ with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください" } do
         validates :next_last_name, presence: true
         validates :next_first_name, presence: true
         end
 
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字混合で入力してください" }

end
