class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id, :position
      t.boolean :done
      t.string :title
      t.datetime :due
      t.text :description
      t.timestamps
    end
  end
end
