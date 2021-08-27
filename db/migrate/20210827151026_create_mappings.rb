class CreateMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :mappings do |t|
      t.references :partner, foreign_key: true
      t.string :dalia_key
      t.string :dalia_value
      t.string :partner_key
      t.string :partner_value

      t.timestamps
    end
  end
end
