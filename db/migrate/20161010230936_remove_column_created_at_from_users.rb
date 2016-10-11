class RemoveColumnCreatedAtFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :created_at, :string
  end
end
