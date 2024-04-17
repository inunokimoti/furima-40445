class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :from_id, :adderss_city, :adderss_number, :adderss_bilding_name, :tel_number, :token, :sale_price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :adderss_city
    validates :adderss_number
    validates :tel_number, format: { with: /\A\d{10,11}\z/, message: "is 10 or 11 digits only" }
    validates :token
  end
  validates :from_id, numericality: { other_than: 1 , message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, from_id: from_id, adderss_city: adderss_city, adderss_number: adderss_number, adderss_bilding_name: adderss_bilding_name, tel_number: tel_number, order_id: order.id)
  end
end