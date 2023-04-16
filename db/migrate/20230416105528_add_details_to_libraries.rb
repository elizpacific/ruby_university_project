class AddDetailsToLibraries < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :city, :string
    add_column :libraries, :zip_code, :integer
    rename_column :libraries, :address, :street_address
    change_column :libraries, :library_id, :string
  end
end
