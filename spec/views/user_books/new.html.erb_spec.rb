# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_books/new', type: :view do
  before(:each) do
    assign(:user, User.new(username: "Adam"))
    assign(:book, Book.new(title: 'Harry Potter', author: 'J.K Rowling', price: '25.0',
                           pdate: { year: '1997', month: 'June', day: '26' }))
    assign(:user_book, UserBook.new(
                         user_id: 1,
                         book_id: 1
                       ))
  end

  it 'renders new user_book form' do
    render

    assert_select 'form[action=?][method=?]', user_books_path, 'post' do
      assert_select 'select[name=?]', 'user_book[user_id]'

      assert_select 'select[name=?]', 'user_book[book_id]'
    end
  end
end
