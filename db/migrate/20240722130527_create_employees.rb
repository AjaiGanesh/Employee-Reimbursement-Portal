class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false, unique: true
      t.string :designation, null: false
      t.references :department, foreign_key: true, index: true, null: false
      t.timestamps
    end
  end
end
