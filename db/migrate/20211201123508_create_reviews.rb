class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :owner_review
      t.text :user_review
      t.integer :owner_rating
      t.integer :user_rating 

      t.timestamps
      t.references :booking, null: false, foreign_key: true
    end
  end
end
