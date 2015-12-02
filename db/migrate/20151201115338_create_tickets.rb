class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.decimal :priceDinner
      t.integer :pricePoints
      t.integer :totalPoints

      t.timestamps null: false
    end
  end
end
