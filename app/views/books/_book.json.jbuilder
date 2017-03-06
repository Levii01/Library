json.extract! book, :id, :name, :grade, :author, :description, :created_at, :updated_at
json.url book_url(book, format: :json)
