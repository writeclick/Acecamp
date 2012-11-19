class CreateTasklists < ActiveRecord::Migration
  def change
    create_table :tasklists do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
