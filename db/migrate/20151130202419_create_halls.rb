class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.references :seat, index: true, foreign_key: true
      t.integer :numberChairP, :default => 0
      t.integer :numberChairG, :default => 0
      
      t.timestamps null: false
    end
  end
end
