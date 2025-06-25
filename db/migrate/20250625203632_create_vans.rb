class CreateVans < ActiveRecord::Migration[7.1]
  def change
    create_table :vans do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.string :model
      t.integer :seats
      t.string :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
