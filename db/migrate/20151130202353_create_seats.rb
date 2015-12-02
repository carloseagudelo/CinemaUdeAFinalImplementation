class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :addres
      t.string :name

      t.timestamps null: false
    end
  end
end
