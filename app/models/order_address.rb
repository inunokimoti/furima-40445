class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :from_id, :adderss_city, :adderss_number, :adderss_bilding_name, :tel_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :adderss_city
    validates :adderss_number
    validates :tel_number, format: {with: /\A[0-9]+$\z/, message: "input only number"}
  end
  validates :from_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, from_id: from_id, adderss_city: adderss_city, adderss_number: adderss_number, adderss_bilding_name: adderss_bilding_name, tel_number: tel_number, order_id: order.id)
  end
end