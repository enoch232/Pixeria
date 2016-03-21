class AddImageFileNameToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :image_file_name, :string
  end
end
