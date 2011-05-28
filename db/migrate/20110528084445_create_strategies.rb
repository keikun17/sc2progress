class CreateStrategies < ActiveRecord::Migration
  def self.up
    create_table :strategies do |t|
      t.string :name
      t.integer :range_low
      t.integer :range_high
      t.string :league
      t.string :link
      t.text :build_order
      t.text :description
      t.string :race
      t.string :play_style
      t.timestamps
    end
  end

  def self.down
    drop_table :strategies
  end
end
