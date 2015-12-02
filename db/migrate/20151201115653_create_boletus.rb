class CreateBoletus < ActiveRecord::Migration
  def change
    create_table :boletus do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :ticket, index: true, foreign_key: true
      t.integer :pricePoints
      t.decimal :priceDinner
      t.integer :pointsNumber
      t.boolean :boletusType

      t.timestamps null: false
    end
  end
end
