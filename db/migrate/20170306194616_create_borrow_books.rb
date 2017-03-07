class CreateBorrowBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :borrow_books do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :book, foreign_key: true
      t.boolean :give_back, default: false

      t.timestamps
    end
  end
end
