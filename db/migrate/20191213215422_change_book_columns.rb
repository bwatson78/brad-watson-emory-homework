# frozen_string_literal: true

# Makes changes to Book's columns
class ChangeBookColumns < ActiveRecord::Migration[5.2]
  def up
    remove_column(:books, :author) if column_exists?(:books, :author)
    unless column_exists?(:books, :publish_year)
      add_column(
        :books, :publish_year, :integer, null: false, default: Time.now.year
      )
    end
    unless column_exists?(:books, :publisher)
      add_column(:books, :publisher, :string, null: false, default: '')
    end
    unless column_exists?(:books, :publisher_city)
      add_column(:books, :publisher_city, :string, null: false, default: '')
    end
    unless index_exists?(:books, :author_id)
      add_reference(:books, :author, index: true)
    end
  end

  def down
    add_column(:books, :author, :string) unless column_exists?(:books, :author)
    if column_exists?(:books, :publish_year)
      remove_column(:books, :publish_year)
    end
    remove_column(:books, :publisher) if column_exists?(:books, :publisher)
    if column_exists?(:books, :publisher_city)
      remove_column(:books, :publisher_city)
    end
    if index_exists?(:books, :author_id)
      remove_reference(:books, :author, index: true)
    end
  end
end
