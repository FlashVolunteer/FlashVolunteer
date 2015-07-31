class CreateHubs < ActiveRecord::Migration
  def up
    create_table :hubs do |t|
      t.column "center", :point
      t.integer :zoom
      t.integer :radius
      t.string :name
    end
  end

  def down
    drop_table :hubs
  end
end
