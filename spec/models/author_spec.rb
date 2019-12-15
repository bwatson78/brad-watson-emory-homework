# frozen_string_literal: true

require 'rails_helper'
require 'helpers/models/book_helpers'

RSpec.configure do |c|
  c.extend BookHelpers
end

RSpec.describe Author, type: :model do
  it {
    is_expected.to respond_to(
      :email,
      :password,
      :first_name,
      :middle_name,
      :last_name,
      :home_town,
      :home_state,
      :dob
    )
  }
  it {
    is_expected.to respond_to(
      :reset_password_token,
      :reset_password_sent_at,
      :sign_in_count,
      :current_sign_in_at,
      :last_sign_in_at,
      :current_sign_in_ip,
      :last_sign_in_ip,
      :books
    )
  }
end

RSpec.describe 'Author#full_name (no middle_name)' do
  clear_authors
  author = author_create

  it 'returns the full name of the author' do
    expect(author.full_name).to eq('Stephen King')
  end
end

RSpec.describe 'Author#full_name (with middle_name)' do
  clear_authors
  author = author_create
  author.update_attribute(:middle_name, 'John')

  it 'returns the full name of the author' do
    expect(author.full_name).to eq('Stephen John King')
  end
end


