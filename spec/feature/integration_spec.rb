# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    title = 'harry potter'
    author = 'J.K. Rowling'
    published = Date.new(2022, 9, 15)
    price = 19.99

    # 1
    scenario 'valid inputs - title on directory page' do
        visit new_book_path
        fill_in 'Title', with: title
        fill_in 'Author', with: author
        fill_in 'Published', with: published
        fill_in 'Price', with: price
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content(title)
    end

    # 2
    scenario 'valid inputs - title' do
        visit new_book_path
        fill_in 'Title', with: title
        fill_in 'Author', with: author
        fill_in 'Published', with: published
        fill_in 'Price', with: price
        click_on 'Create Book'
        visit book_url(Book.last.id)
        expect(page).to have_content(title)
    end

    # 3
    scenario 'valid inputs - author' do
        visit new_book_path
        fill_in 'Title', with: title
        fill_in 'Author', with: author
        fill_in 'Published', with: published
        fill_in 'Price', with: price
        click_on 'Create Book'
        visit book_url(Book.last.id)
        expect(page).to have_content(author)
    end

    # 4
    scenario 'valid inputs - published' do
        visit new_book_path
        fill_in 'Title', with: title
        fill_in 'Author', with: author
        fill_in 'Published', with: published
        fill_in 'Price', with: price
        click_on 'Create Book'
        visit book_url(Book.last.id)
        expect(page).to have_content(published.year)
        expect(page).to have_content(published.month)
        expect(page).to have_content(published.day)
    end

    # 5
    scenario 'valid inputs - price' do
        visit new_book_path
        fill_in 'Title', with: title
        fill_in 'Author', with: author
        fill_in 'Published', with: published
        fill_in 'Price', with: price
        click_on 'Create Book'
        visit book_url(Book.last.id)
        expect(page).to have_content(price)
    end
end
