# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home path', type: :request do
  before(:each) do
    get '/'
  end

  it 'travels to the home page' do
    expect(response).to have_http_status(:success)
  end

  it 'renders home' do
    expect(response).to render_template(:home)
  end

  it 'should have the correct header' do
    expect(response.body).to include 'Rails Bookshelf'
  end

  it 'should have the correct footer' do
    expect(response.body).to include '&copy; Brad DA Watson 2019'
  end

  it 'should have the correct body text' do
    test_text1 = 'Welcome to Rails Bookshelf! A Website specifically designed '
    test_text2 = "to keep track of author's books."
    expect(response.body).to include(test_text1 + test_text2)
  end
end
