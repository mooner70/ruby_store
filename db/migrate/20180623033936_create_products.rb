class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product
      t.decimal :amount
      t.date :date
      t.integer :user_id
      t.string :buyer_id

      t.timestamps null: false
    end
  end
end
