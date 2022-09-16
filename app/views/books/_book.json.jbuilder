json.extract! book, :id, :title, :created_at, :updated_at, :author, :published, :price
json.url book_url(book, format: :json)
