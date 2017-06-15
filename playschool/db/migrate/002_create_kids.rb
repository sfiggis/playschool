class CreateKids < ActiveRecord::Migration
  def self.up
    create_table :kids do |t|
      
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :kids
  end
end
