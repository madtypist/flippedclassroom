class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :grade
      t.string :code
      t.string :activePlaylistLink

      t.timestamps
    end
  end
end
