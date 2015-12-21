class AddShopIdToGood < ActiveRecord::Migration
  def change
  	add_column :goods, :shop_id, :integer
  end
end
