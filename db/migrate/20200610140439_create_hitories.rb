class CreateHitories < ActiveRecord::Migration
  def change
    create_table :hitories do |t|
      t.string :doctor_desc 
      t.string :doctor_name
      t.string :age_at_visit
      t.date :date
      t.integer :member_id
      t.integer :disease_id
      t.timestamps null: false
    end
  end
end
