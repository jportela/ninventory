class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :status
      t.string :holder

      t.timestamps
    end
  end
end
