class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :name
      t.text :motto

      t.timestamps
    end
  end
end
