class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|

    	t.string  :name
    	t.float :price
    	t.string :cuisine
    	t.string :type
    	t.text :dietaryReq

      t.timestamps
    end
  end
end
