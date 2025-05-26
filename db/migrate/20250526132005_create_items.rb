class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :description
      t.string :name
      t.float :price
      t.float :rating
      t.integer :power
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
