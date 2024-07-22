class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :employee, foreign_key: true, null: false, index: true
      t.integer :amount, null: false
      t.string :bill_type, null: false

      t.timestamps
    end
  end
end
