class Registrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
