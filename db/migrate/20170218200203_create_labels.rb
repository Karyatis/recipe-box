class CreateLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :labels do |t|
      t.string :description

      t.timestamps(null: false)
    end
  end
end
