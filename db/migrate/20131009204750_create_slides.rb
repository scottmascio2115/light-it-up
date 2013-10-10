class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :slideshow_id
      t.integer :user_id
      t.string  :title
      t.integer :sort_order

      t.timestamps
    end
  end
end
