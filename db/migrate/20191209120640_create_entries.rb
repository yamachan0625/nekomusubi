class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :user
      t.references :room

      t.timestamps
    end
  end
end
