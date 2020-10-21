class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :organization
      t.string :url
      t.string :summary
      t.string :donation_options

      t.timestamps
    end
  end
end
