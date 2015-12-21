class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
    	t.string :shopname
    	t.string :address
    	t.string :phone
    	t.timestamps
    end
  end
end
