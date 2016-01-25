class AddUserIdToIdeas < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :integer
  end
end
