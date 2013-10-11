class ChangeSlideTable < ActiveRecord::Migration
  def change
    change_table :slides do |t|
      t.rename :user_id, :creator_id
    end
  end
end
