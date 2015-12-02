class AddNameToChairs < ActiveRecord::Migration
  def change
    add_column :chairs, :name, :string
  end
end
