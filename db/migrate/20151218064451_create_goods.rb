class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
    	t.string :name
    	t.integer :price
    	t.text :summary
    	t.text :description
    	t.timestamps
    end
  end
end
