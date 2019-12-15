# frozen_string_literal: true

# creates actions and validations for Books controller.
class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :create_book, only: [:create]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  # POST /books.json
  def create
    respond_to do |format|
      if @book.save
        format.html { redirect_to current_author, notice: create_notice_string }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to current_author, notice: update_notice_string }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy

    respond_to do |format|
      if current_author == @book.author && @book.destroy
        format.html {
          redirect_to current_author,
          notice: destroy_notice_string
        }
      else
        format.html { redirect_to @book, error: destroy_error_string }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # sets up a new book with permitted params
  def create_book
    @book = current_author.books.build(book_params)
  end

  # holds the notice for create
  def create_notice_string
    'Book was successfully created.'
  end

  # holds the update notice string
  def update_notice_string
    'Book was successfully updated.'
  end

  # holds the destroy notice string
  def destroy_notice_string
    'Book was successfully destroyed.'
  end

  # holds the destroy error message
  def destroy_error_string
    'There was an error destroying this book'
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def book_params
    params.require(:book).permit(:title, :publish_year, :publisher, :publisher_city)
  end
end
