class CreateLabelings < ActiveRecord::Migration[5.0]
  def change
    create_table :labelings do |t|
      t.references :recipe, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
