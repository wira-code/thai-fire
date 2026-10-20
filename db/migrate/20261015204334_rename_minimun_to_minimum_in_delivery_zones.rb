class RenameMinimunToMinimumInDeliveryZones < ActiveRecord::Migration[8.1]
  def change
    rename_column :delivery_zones, :minimun_order_cents, :minimum_order_cents
  end
end
