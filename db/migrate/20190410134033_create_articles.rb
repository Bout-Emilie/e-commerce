class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.integer :prix
      t.string :description
      t.timestamps
    end
  end
end
