class CreateElementTypes < ActiveRecord::Migration
  def change
    create_table :element_types do |t|
      t.string :name
      t.string :before_tag
      t.string :after_tag

      t.timestamps
    end
  end
end
