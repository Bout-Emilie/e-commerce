class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :numero
      t.integer :user_id
      t.integer :article_id
      t.timestamps
    end
  end
end
