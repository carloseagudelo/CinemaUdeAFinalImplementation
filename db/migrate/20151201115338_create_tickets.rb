class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.integer :amountGeneral
      t.integer :amountPopular
      t.integer :pointsValue
      t.decimal :moneyValue
      t.boolean :wayPAy

      t.timestamps null: false
    end
  end
end
