# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  def fill_in_book_form(title:, author:, price:, pdate_year:, pdate_month:, pdate_day:)
    visit new_book_path
    fill_in "book[title]", with: title
    fill_in "book[author]", with: author
    fill_in "book[price]", with: price

    # Fill in the date using date_select
    select pdate_day, from: 'book_pdate_3i' # day
    select pdate_month, from: 'book_pdate_2i' # month
    select pdate_year, from: 'book_pdate_1i' # year
  end

  scenario 'valid inputs' do
    fill_in_book_form(title: 'Harry Potter', author: 'J.K Rowling', price: '25.0', pdate_year: '1997', pdate_month: 'June', pdate_day: '26')
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end

  scenario 'creating book with missing title' do
    fill_in_book_form(title: '', author: 'J.K Rowling', price: '25.0', pdate_year: '1997', pdate_month: 'June', pdate_day: '26')
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'creating book with missing author' do
    fill_in_book_form(title: 'Harry Potter', author: '', price: '25.0', pdate_year: '1997', pdate_month: 'June', pdate_day: '26')
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'creating book with missing price' do
    fill_in_book_form(title: 'Harry Potter', author: 'J.K Rowling', price: '', pdate_year: '1997', pdate_month: 'June', pdate_day: '26')
    click_on 'Create Book'
    expect(page).to have_content('Price is not a number')
  end

  scenario 'creating book with missing pdate' do
    fill_in_book_form(title: 'Harry Potter', author: 'J.K Rowling', price: '25.0', pdate_year: '', pdate_month: '', pdate_day: '')
    click_on 'Create Book'
    expect(page).to have_content("Pdate can't be blank")
  end
end
