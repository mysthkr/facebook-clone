class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      add_index :users, :email, unique: true
      t.timestamps
    end
  end
end
