class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :details
      t.float :latitude
      t.float :longitude
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
