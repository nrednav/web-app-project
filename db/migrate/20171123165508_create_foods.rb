class CreateFoods < ActiveRecord::Migration[5.1]

  def up
    create_table :foods do |t|

      t.string  'name'
      t.float 'price'
      t.string 'cuisine'
      t.string 'mealType'
      t.string 'category'
      t.text 'dietaryReq', :default => 'None'

      t.timestamps
    end
  end

  def down
    drop_table :foods
  end

end
