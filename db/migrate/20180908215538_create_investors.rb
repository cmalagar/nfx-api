class CreateInvestors < ActiveRecord::Migration[5.2]
  def change
    create_table :investors do |t|
      t.string :company
      t.string :location
      t.string :contact
      t.string :stage
      t.string :interest

      t.timestamps
    end
  end
end
