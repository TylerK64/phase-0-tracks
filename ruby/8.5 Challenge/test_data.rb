def populate_dates(db) #only populate dates from current year
  dates_db = db.execute("SELECT date FROM dates")
  days_per_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  days_per_month.length.times do |l|
    month = l + 1
    days = days_per_month[l]
    days.times do |i|
      date_string = "2017-#{month}-" + (i+1).to_s
      date_new = db.execute("SELECT date FROM dates WHERE date IN (?)", date_string)
      if !dates_db.include?(date_new.flatten)
        db.execute("INSERT INTO dates (date) VALUES (?)", date_string)
      end
    end
  end
end