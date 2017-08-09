class AddLocationToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :location
  end
end
