json.extract! book, :id, :title, :author, :category, :comment, :isbn, :created_at, :updated_at
json.url book_url(book, format: :json)
