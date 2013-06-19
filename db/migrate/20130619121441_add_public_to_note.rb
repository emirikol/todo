class AddPublicToNote < ActiveRecord::Migration
  def change
    add_column :notes, :public, :boolean, default: false, null: false
  end
end
