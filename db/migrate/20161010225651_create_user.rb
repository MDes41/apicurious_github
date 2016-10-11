class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :avatar_url
      t.string :email
      t.string :uid
      t.string :name
      t.string :login
      t.string :created_at
    end
  end
end
