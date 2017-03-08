module UserBookHelper
  def shortest_timme(full_time)
    full_time.strftime("%_d.%m.%Y, %R") if full_time
  end

  def given_back?(book)
    book.created_at != book.updated_at
  end
end
