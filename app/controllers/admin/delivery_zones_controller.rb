class Admin::DeliveryZonesController < ApplicationController
  before_action :authenticate_user! # หรือ method เช็กสิทธิ์ admin ของโครงการ
  before_action :ensure_admin
  before_action :set_delivery_zone, only: [ :edit, :update, :destroy ]

  def index
    @delivery_zones = DeliveryZone.order(created_at: :asc)
  end

  def new
    @delivery_zone = DeliveryZone.new
  end

  def create
    @delivery_zone = DeliveryZone.new(delivery_zone_params)
      if @delivery_zone.save
        redirect_to admin_delivery_zones_path, notice: "Delivery Zone created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end

  def update
    if @delivery_zone.update(delivery_zone_params)
        redirect_to admin_delivery_zones_path, notice: "Delivery Zone updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @delivery_zone.destroy
      redirect_to admin_delivery_zones_path, notice: "Delivery Zone deleted successfully!"
  end


  private

  def set_delivery_zone
    @delivery_zone = DeliveryZone.find(params[:id])
  end

  def delivery_zone_params
    params.require(:delivery_zone).permit(:name, :postal_code, :delivery_fee_cents, :minimum_order_cents, :active)
  end

  def ensure_admin
    redirect_to root_path, alert: "Access denied!" unless current_user&.admin?
  end
end
