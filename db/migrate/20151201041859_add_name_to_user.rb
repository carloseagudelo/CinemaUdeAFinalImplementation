class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :document, :string
    add_column :users, :lastName, :string
    add_column :users, :numberPoint, :integer, :default => 0
  end
end
