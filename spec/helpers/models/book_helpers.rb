module BookHelpers
  def author_create
    Author.create!(
      email: 'email@email.com',
      password: 'Password123',
      password_confirmation: 'Password123',
      first_name: 'Stephen',
      last_name: 'King',
      home_town: 'Bangor',
      home_state: 'ME'
    )
  end

  def clear_authors
    Author.delete_all
  end

  def book_create(author)
    author.books.create(
      title: 'It',
      publish_year: 1970,
      publisher: 'Penguin',
      publisher_city: 'Boston'
    )
  end
end
