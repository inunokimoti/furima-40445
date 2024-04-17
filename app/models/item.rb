class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :from
  belongs_to :transport_day

  validates :image, presence: true
  validates :item_name, presence: true
  validates :describe, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :from_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :transport_day_id, numericality: { other_than: 1 , message: "can't be blank" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :sale_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "can't be blank"}
  end
end
