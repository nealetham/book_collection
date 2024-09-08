# frozen_string_literal: true

class CreateJoinTableBooksCategories < ActiveRecord::Migration[7.2]
  def change
    create_join_table :books, :categories do |t|
      t.index %i[book_id category_id]
      t.index %i[category_id book_id]
    end
  end
end
