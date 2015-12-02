class AddDateToHorary < ActiveRecord::Migration
  def change
  	add_column :horaries, :horaryname, :string
    add_column :horaries, :hourBegin, :time
    add_column :horaries, :hourEnd, :time
  end
end
