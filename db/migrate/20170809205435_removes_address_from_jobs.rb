class RemovesAddressFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :address
  end
end
