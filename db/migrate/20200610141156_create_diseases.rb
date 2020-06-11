class CreateDiseases < ActiveRecord::Migration[5.1]
  def change
    create_table :diseases do |t|
      t.string :name
      t.string :desc
      t.timestamps null: false
    end
  end
end
