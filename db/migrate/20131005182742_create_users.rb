class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_email
      t.string :password_hash

      t.timestamps
    end
  end
end
