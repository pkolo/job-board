class RemoveZipFromLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :zip
  end
end
