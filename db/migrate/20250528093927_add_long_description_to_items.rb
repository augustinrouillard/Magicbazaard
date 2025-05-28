class AddLongDescriptionToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :long_description, :text
  end
end
