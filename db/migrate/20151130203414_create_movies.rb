class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :horary, index: true, foreign_key: true
      t.references :hall, index: true, foreign_key: true      
      t.references :quality, index: true, foreign_key: true
      t.string :name
      t.integer :duration, :default => 0
      t.string :information
      #Corresponde a la boleta.
      t.decimal :priceGeneral, :default => 0
      t.decimal :pricePopular, :default => 0
      t.integer :pointsGeneral, :default => 0
      t.integer :pountsPopular, :default => 0

      t.integer :setPoints, :default => 0
      t.timestamps null: false
    end
  end
end
