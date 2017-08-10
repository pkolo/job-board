class RemovesLatitudeAndLongitudeFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :latitude
    remove_column :jobs, :longitude
  end
end
