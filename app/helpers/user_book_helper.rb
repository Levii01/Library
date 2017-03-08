module UserBookHelper
  def shortest_timme(full_time)
    full_time.strftime("%_d.%m.%Y, %R") if full_time
  end
end
