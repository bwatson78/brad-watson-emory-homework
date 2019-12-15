# frozen_string_literal: true

require 'rails_helper'
require 'helpers/models/book_helpers'

RSpec.configure do |c|
  c.extend BookHelpers
end

RSpec.describe 'authors/index', type: :view do
  clear_authors

  it 'displays all authors' do
    assign(:authors, [
      Author.create!(
        email: 'email@email.com',
        password: 'Password123',
        password_confirmation: 'Password123',
        first_name: 'Stephen',
        last_name: 'King',
        home_town: 'Bangor',
        home_state: 'ME'
      )
    ])

    render

    expect(rendered).to match "<h2>Authors</h2>"
    expect(rendered).to match /Stephen King/
  end
end

RSpec.describe 'authors/show', type: :view do
  clear_authors

  it "displays author's books and details" do
    assign(:author,
      Author.create!(
        email: 'email@email.com',
        password: 'Password123',
        password_confirmation: 'Password123',
        first_name: 'Stephen',
        last_name: 'King',
        home_town: 'Bangor',
        home_state: 'ME'
      )
    )
    assign(:books, [
      Author.first.books.create(
        title: 'It',
        publish_year: 1970,
        publisher: 'Penguin',
        publisher_city: 'Boston')
    ])

    render

    expect(rendered).to match "<h2>Author's Details</h2>"
    expect(rendered).to match /Stephen King/
    expect(rendered).to match /Bangor, ME/
    expect(rendered).to match /It/
    expect(rendered).to match /1970/
  end
end
