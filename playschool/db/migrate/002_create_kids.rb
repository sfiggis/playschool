class CreateKids < ActiveRecord::Migration[5.1]
  def self.up
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.text :notes
      t.references :group
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :kids
  end
end
