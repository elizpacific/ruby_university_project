class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.string :library_id

      t.timestamps
    end
  end
end
