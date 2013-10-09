class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :slideshow_id
      t.string  :title
      t.integer :page

      t.timestamps
    end
  end
end
