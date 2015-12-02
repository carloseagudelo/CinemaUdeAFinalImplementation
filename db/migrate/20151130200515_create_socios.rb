class CreateSocios < ActiveRecord::Migration
  def change
    create_table :socios do |t|
      t.string :name
      t.string :document
      t.string :lastName
      t.string :email
      t.string :password
      t.integer :numberPoints

      t.timestamps null: false
    end
  end
end
