class AddsAddressToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :address, :string, null: false
  end
end
