json.extract! book, :id, :title, :grade, :author, :description, :created_at, :updated_at
json.url book_url(book, format: :json)
