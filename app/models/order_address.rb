class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
  end
    validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, presence: true
    validates :block, presence: true
    validates :phone_number, presence: true, format: {with:/\A\d{10,11}\z/}

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, item_orders_id: item_orders.id, user_id: user_id, item_id: item_id)
    end
end