class CreateHoraries < ActiveRecord::Migration
  def change
    create_table :horaries do |t|
      t.date :begin

      t.timestamps null: false
    end
  end
end
