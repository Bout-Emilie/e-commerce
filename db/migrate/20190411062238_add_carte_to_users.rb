class AddCarteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :carte, :string
  end
end
