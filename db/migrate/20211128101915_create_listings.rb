class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|

      t.timestamps
      t.string :name
      t.string :address
      t.text :description
      t.integer :capacity
      t.float :rate_per_day
      t.references :user, null: false, foreign_key: true
    end
  end
end
