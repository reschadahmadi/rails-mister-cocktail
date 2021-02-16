class CreateIngedients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingedients do |t|
      t.string :name

      t.timestamps
    end
  end
end
