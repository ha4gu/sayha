class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.belongs_to :activity, null: false, foreign_key: true
      t.integer :position
      t.string :name, null: false

      t.timestamps
    end
  end
end
