class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def create
    @order = current_user.orders.find(params[:order_id])
    @review = @order.build_review(review_params)
    @review.user = current_user

    if @review.save
      redirect_to order_path(@order), notice: "ขอบคุณสำหรับรีวิวและคะแนนครับ!"
    else
      redirect_to order_path(@order), alert: "ไม่สามารถบันทึกรีวิวได้ กรุณาใส่คะแนน 1-5 ดาว"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
