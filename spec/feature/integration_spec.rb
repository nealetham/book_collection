# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.shared_context 'book creation form setup' do
  def fill_in_book_form(title:, author:, price:, pdate:)
    visit new_book_path
    fill_in 'book[title]', with: title
    fill_in 'book[author]', with: author
    fill_in 'book[price]', with: price
    select pdate[:day], from: 'book_pdate_3i'
    select pdate[:month], from: 'book_pdate_2i'
    select pdate[:year], from: 'book_pdate_1i'
    click_on 'Create Book'
  end
end

RSpec.describe 'Create book with valid inputs', type: :feature do
  include_context 'book creation form setup'

  it 'valid title, author, price and date' do
    fill_in_book_form(title: 'Harry Potter', author: 'J.K Rowling',
                      price: '25.0', pdate: { year: '1997', month: 'June', day: '26' })
    visit books_path
    expect(page).to have_content('Harry Potter')
  end
end

RSpec.describe 'Create book with missing title', type: :feature do
  include_context 'book creation form setup'

  it 'missing title, valid otherwise' do
    fill_in_book_form(title: '', author: 'J.K Rowling',
                      price: '25.0', pdate: { year: '1997', month: 'June', day: '26' })
    expect(page).to have_content("Title can't be blank")
  end
end

RSpec.describe 'Create book with missing author', type: :feature do
  include_context 'book creation form setup'

  it 'missing title, valid otherwise' do
    fill_in_book_form(title: 'Harry Potter', author: '',
                      price: '25.0', pdate: { year: '1997', month: 'June', day: '26' })
    expect(page).to have_content("Author can't be blank")
  end
end

RSpec.describe 'Create book with missing price', type: :feature do
  include_context 'book creation form setup'

  it 'missing price, valid otherwise' do
    fill_in_book_form(title: 'Harry Potter', author: 'J.K Rowling',
                      price: '', pdate: { year: '1997', month: 'June', day: '26' })
    expect(page).to have_content('Price is not a number')
  end
end

RSpec.describe 'Create book with missing pdate', type: :feature do
  include_context 'book creation form setup'

  it 'missing pdate, valid otherwise' do
    fill_in_book_form(title: 'Harry Potter', author: 'J.K Rowling',
                      price: '25.0', pdate: { year: '', month: '', day: '' })
    expect(page).to have_content("Pdate can't be blank")
  end
end
