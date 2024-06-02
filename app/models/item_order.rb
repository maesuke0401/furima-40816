class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :post_code, :source_id, :city, :building_name, :house_number, :phone, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :source_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :phone, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :house_number
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, source_id: source_id, city: city, building_name: building_name, house_number: house_number, phone: phone, order_id: order.id)
  end
end