# frozen_string_literal: true

require 'rails_helper'
require 'helpers/models/book_helpers'

RSpec.configure do |c|
  c.extend BookHelpers
end


RSpec.describe Book, type: :model do
  it {
    is_expected.to respond_to(
      :title,
      :publish_year,
      :publisher,
      :publisher_city,
      :author
    )
  }
end

RSpec.describe Book, type: :model do
  it 'must have a title' do
    book = Book.new(title: nil)
    expect(book).to_not be_valid
  end

  it 'must have a publish year' do
    book = Book.new(publish_year: nil)
    expect(book).to_not be_valid
  end

  it 'must have a publisher' do
    book = Book.new(publisher: nil)
    expect(book).to_not be_valid
  end

  it 'must have a publisher city' do
    book = Book.new(publisher_city: nil)
    expect(book).to_not be_valid
  end
end

RSpec.describe Book, type: :model do
  clear_authors
  author = author_create
  book = book_create(author)
  citation = 'King, Stephen. It. Boston: Penguin, 1970. Print.'
  it '#citation returns the correctly formatted string (no middle name)' do
    expect(book.citation).to eq(citation)
  end
end

RSpec.describe Book, type: :model do
  clear_authors
  author = author_create
  author.update_attribute(:middle_name, 'James')
  book = book_create(author)
  citation = 'King, Stephen James. It. Boston: Penguin, 1970. Print.'
  it '#citation returns the correctly formatted string (with middle name)' do
    expect(book.citation).to eq(citation)
  end
end
