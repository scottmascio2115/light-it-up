class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.integer :user_id
      t.string  :name
      t.boolean :shared, default: false
      t.integer :px_width, default: 1280
      t.integer :px_height, default: 720

      t.timestamps
    end
  end
end
