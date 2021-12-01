class AddFirstNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :description, :text
    add_column :users, :owner_rating, :integer, default: 0
    add_column :users, :host_rating, :integer, default: 0
  end
end
