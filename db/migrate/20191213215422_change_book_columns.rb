class ChangeBookColumns < ActiveRecord::Migration[5.2]
  def up
    remove_column(:books, :author) if column_exists?(:books, :author)
    add_column(
      :books, :publish_year, :integer, null: false, default: Time.now.year
    ) unless column_exists?(:books, :publish_year)
    add_column(
      :books, :publisher, :string, null: false, default: ""
    ) unless column_exists?(:books, :publisher)
    add_column(
      :books, :publisher_city, :string, null: false, default: ""
    ) unless column_exists?(:books, :publisher_city)
    add_reference(
      :books, :author, index: true
    ) unless index_exists?(:books, :author_id)
  end

  def down
    add_column(:books, :author, :string) unless column_exists?(:books, :author)
    remove_column(:books, :publish_year) if column_exists?(:books, :publish_year)
    remove_column(:books, :publisher) if column_exists?(:books, :publisher)
    remove_column(
      :books, :publisher_city
    ) if column_exists?(:books, :publisher_city)
    remove_reference(
      :books, :author, index: true
    ) if index_exists?(:books, :author_id)
  end
end
