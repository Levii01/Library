class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name, unique: true, null: false, index: true
      t.string :grade
      t.string :author, null: false
      t.text :description

      t.timestamps
    end
  end
end
