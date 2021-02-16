class CreateDoses < ActiveRecord::Migration[6.1]
  def change
    create_table :doses do |t|
      t.text :description
      t.integer :ingredient_id, index: true
      t.integer :dose_id, index: true

      t.timestamps
    end
  end
end
