class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.float :amount
      t.text :to_address
      t.text :from_address
      t.text :note
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
