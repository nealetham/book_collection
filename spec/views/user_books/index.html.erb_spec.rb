# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_books/index', type: :view do
  before(:each) do
    user = User.create!(username: "Adam")
    book = Book.create!(title: 'Harry Potter', author: 'J.K Rowling', price: '25.0', pdate: Date.new(1997, 6, 26))
    assign(:user_books, [UserBook.create!(user: user, book: book)])
  end

  it 'renders a list of user_books' do
    render
    assert_select 'tr>td', text: 'Adam', count: 1
    assert_select 'tr>td', text: 'Harry Potter', count: 1
  end
end
