class AddCategoryToMedications < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :category_id, :integer
  end
end
