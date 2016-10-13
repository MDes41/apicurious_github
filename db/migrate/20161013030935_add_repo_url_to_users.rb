class AddRepoUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :repo_url, :string
  end
end
