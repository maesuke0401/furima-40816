class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipping
  belongs_to :source


  
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :condition_id, numericality: { other_than: 1 ,message: "can't be blank" }, presence: true
  validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank"}, presence: true
  validates :shipping_id, numericality: { other_than: 1, message: "can't be blank"}, presence: true
  validates :source_id, numericality: { other_than: 1, message: "can't be blank"}, presence: true
  validates :product, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :price_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  
  def was_attached?
    self.image.attached?
  end
end