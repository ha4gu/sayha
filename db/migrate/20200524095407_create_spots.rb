class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.belongs_to :group, null: false, foreign_key: true
      t.integer :position
      t.string :name, null: false

      # precision: 合計桁数, scale: 小数点以下桁数
      t.decimal :latitude, precision: 10, scale: 7, null: false
      t.decimal :longitude, precision: 10, scale: 7, null: false

      t.timestamps
    end
  end
end
