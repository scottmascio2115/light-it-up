class CreateElementTypes < ActiveRecord::Migration
  def change
    create_table :element_types do |t|

      t.timestamps
    end
  end
end
