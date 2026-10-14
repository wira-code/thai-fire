class DeliveryZone < ApplicationRecord
  has_many :orders, dependent: :restrict_with_error

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :delivery_fee_cents, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :minimun_order_cents, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :active, inclusion: { in: [ true, false ] }

  scope :active, -> { where(active: true) }

  def delivery_fee
    delivery_fee_cents / 100.0
  end

  def minimum_order
    minimum_order_cents / 100.0
  end
end
