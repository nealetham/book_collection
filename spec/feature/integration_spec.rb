# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end

  scenario 'creating book with missing title' do
    visit new_book_path
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'creating book with author' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: "J.K Rowling"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end

  scenario 'creating book with price' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[price]", with: "30"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end

  scenario 'creating book with published date' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[pdate]", with: "2024-08-30"
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end
end