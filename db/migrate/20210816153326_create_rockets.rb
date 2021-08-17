class CreateRockets < ActiveRecord::Migration[6.0]
  def change
    create_table :rockets do |t|
      t.string :name
      t.integer :price
      t.string :fuel
      t.text :description

      t.timestamps
    end
  end
end
