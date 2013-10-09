class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|

      t.timestamps
    end
  end
end
