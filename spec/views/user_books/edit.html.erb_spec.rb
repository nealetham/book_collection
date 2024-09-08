# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_books/edit', type: :view do
  before do
    # Create records
    user = User.new(username: 'Adam')
    book = Book.new(title: 'Harry Potter', author: 'J.K Rowling', price: '25.0',
                    pdate: { year: '1997', month: 'June', day: '26' })
    @user_book = UserBook.create!(user:, book:)

    # Assign to view
    assign(:user_book, @user_book)
  end

  it 'renders the edit user_book form' do
    render

    assert_select 'form[action=?][method=?]', user_book_path(@user_book), 'post' do
      assert_select 'select[name=?]', 'user_book[user_id]'
      assert_select 'select[name=?]', 'user_book[book_id]'
    end
  end
end
