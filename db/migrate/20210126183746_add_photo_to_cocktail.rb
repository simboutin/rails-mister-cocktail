class AddPhotoToCocktail < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :photo, :string
  end
end
