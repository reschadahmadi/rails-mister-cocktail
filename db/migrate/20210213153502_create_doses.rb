class CreateDoses < ActiveRecord::Migration[6.1]
  def change
    create_table :doses do |t|
      t.text :description
      t.integer :cocktail_id, index: true
      t.integer :ingredient_id, index: true

      t.timestamps
    end

    add_index :doses, [:cocktail_id, :ingredient_id], unique: true
  end
end
