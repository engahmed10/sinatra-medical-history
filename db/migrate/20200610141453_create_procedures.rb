class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.string :proce_doctor
      t.string :hospital
      t.string :desc
      t.integer :age_at_proc
      t.integer :member_id
      t.integer :disease_id
      t.timestamps null: false
    end
  end
end
