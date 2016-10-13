class RenameColunmInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :repo_url, :repos_url
  end
end
