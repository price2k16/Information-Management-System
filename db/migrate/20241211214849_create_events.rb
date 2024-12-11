class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.text :description, default: ''
      t.text :guest_list

      t.timestamps
    end
  end
end
