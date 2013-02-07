class AddEmailUniquenessIndex < ActiveRecord::Migration

	#Garantizar que el email sea unico
  def up
  		add_index :users, :email, :unique => true
  end

  def down
  		remove_index :users, :email
  end
end
