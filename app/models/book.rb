# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :user_books

  validates :title, presence: true
  validates :author, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :pdate, presence: true
  has_and_belongs_to_many :categories
end
