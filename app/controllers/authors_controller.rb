# frozen_string_literal: true

# creates actions outside of devise's purview for authors
class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(id: params[:id])

    if !@author.present?
      redirect_to root, error: 'Author not found.'
    end
  end
end
