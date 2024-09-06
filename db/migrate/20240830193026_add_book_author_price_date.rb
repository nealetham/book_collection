# frozen_string_literal: true

class AddBookAuthorPriceDate < ActiveRecord::Migration[7.2]
  def change
    add_column :books, :author, :string
    add_column :books, :price, :decimal, precision: 10, scale: 2
    add_column :books, :pdate, :date
  end
end
