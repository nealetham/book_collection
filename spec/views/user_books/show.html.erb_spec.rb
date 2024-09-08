# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_books/show', type: :view do
  before(:each) do
    user = User.create!(username: 'Adam')
    book = Book.create!(title: 'Harry Potter', author: 'J.K Rowling', price: '25.0', pdate: Date.new(1997, 6, 26))
    @user_book = UserBook.create!(user:, book:)

    assign(:user_book, @user_book)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Adam/)
    expect(rendered).to match(/Harry Potter/)
  end
end
