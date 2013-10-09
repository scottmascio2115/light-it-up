class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :slide_id
      t.integer :element_type_id
      t.string  :content
      t.string  :size
      t.string  :coordinates

      t.timestamps
    end
  end
end
