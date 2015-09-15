class AddProjectIdToDrafts < ActiveRecord::Migration
  def change
  	add_column :drafts, :project_id, :integer
  end
end
