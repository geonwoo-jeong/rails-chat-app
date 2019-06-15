class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, index: { unique: true }
      t.string :password_digest
      t.timestamps
    end    
    add_index :username, :password_digest
  end  
end
