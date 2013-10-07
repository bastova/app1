class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
	  t.has_many :pets

      t.timestamps
    end
  end
end
