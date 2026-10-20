class Review < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, length: { maximum: 500 }, allow_blank: true
  validates :order_id, uniqueness: { scope: :user_id, message: "You have already submitted a review for this order" }
end
