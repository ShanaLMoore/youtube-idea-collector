class AddIdeaIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :idea_id, :integer
  end
end
