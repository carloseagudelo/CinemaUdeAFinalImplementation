class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.references :horary, index: true, foreign_key: true
      t.references :hall, index: true, foreign_key: true
      t.references :chair, index: true, foreign_key: true
      t.references :quality, index: true, foreign_key: true
      t.string :name
      t.integer :duration
      t.string :information
      t.boolean :format
      #Corresponde a la boleta.
      t.decimal :priceGeneral
      t.decimal :pricePopular
      t.integer :pointsGeneral
      t.integer :pountsPopular

      t.integer :setPointsGeneral
      t.integer :setPointsPopuar
      t.timestamps null: false
    end
  end
end
