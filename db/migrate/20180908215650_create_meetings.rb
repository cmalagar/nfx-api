class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :time
      t.references :investor, foreign_key: true

      t.timestamps
    end
  end
end
