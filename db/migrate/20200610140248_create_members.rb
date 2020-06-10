class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :order_age
      t.string :kinship
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
