class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.references :seat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
