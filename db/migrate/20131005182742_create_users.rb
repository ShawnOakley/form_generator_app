class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_email
      t.string :session_token
      t.string :password_hash

      t.timestamps
    end

    add_index :users, :username, :unique => true
    add_index :users, :user_email, :unique => true
    add_index :users, :session_token, :unique => true
  end
end
