class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.integer :amountGeneral, :default => 0
      t.integer :amountPopular, :default => 0
      t.integer :totalPrice, :default => 0
      t.boolean :wayPAy, :default => 0

      t.timestamps null: false
    end
  end
end
