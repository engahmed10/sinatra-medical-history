class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.string :name
      t.string :proce_doctor
      t.string :hospital
      t.date  :date_porc
      t.string :desc
      t.integer :age_at_proc
      t.integer :member_id
      t.integer :disease_id
      t.timestamps null: false
    end
  end
end
