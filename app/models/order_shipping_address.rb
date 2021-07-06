class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number, format: {with: /\A\d{11}\z/}
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
