class CreateGroups < ActiveRecord::Migration[5.1]
  def self.up
    create_table :groups do |t|
      t.string :name
      t.text :notes
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :groups
  end
end
