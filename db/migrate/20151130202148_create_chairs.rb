class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.integer :numberChairP
      t.integer :numberChairG
      t.integer :occupiedP
      t.integer :occupiedG

      t.timestamps null: false
    end
  end
end
