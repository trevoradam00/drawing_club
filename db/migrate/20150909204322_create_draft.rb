class CreateDraft < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
    	t.string :name
    	t.text :description
    	t.timestamps
    end
  end
end
