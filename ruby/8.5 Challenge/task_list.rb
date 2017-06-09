require 'sqlite3'

def existsCheck(db, table, task_new, location_id_new, due_date_new)
end

def new_task(db, task_new, location, due_date)
  db.execute("INSERT INTO tasks (task, location_id, due_date_id) VALUES (?, ?, ?)", [task_new, location, due_date])
end

def populate_dates(db)
  days_per_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  days_per_month.length.times do |l|
    month = l + 1
    days = days_per_month[l]
    days.times do |i|
      date_string = "2017-#{month}-" + (i+1).to_s
      db.execute("INSERT INTO dates (date) VALUES (?)", date_string)
    end
  end
end

create_dates_table = <<-SQL
  CREATE TABLE IF NOT EXISTS dates (
    id INTEGER PRIMARY KEY,
    date TEXT
  )
SQL
create_locations_table = <<-SQL
  CREATE TABLE IF NOT EXISTS locations (
    id INTEGER PRIMARY KEY,
    location VARCHAR(255)
  )
SQL
create_tasks_table = <<-SQL
  CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY,
    task VARCHAR(255),
    location_id INTEGER not null,
    due_date_id INTEGER not null,
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (due_date_id) REFERENCES dates(id)
  )
SQL

db = SQLite3::Database.new("task_list.db")
db.results_as_hash = true

db.execute(create_tasks_table)
db.execute(create_dates_table)
db.execute(create_locations_table)

#db.execute("DELETE FROM dates")

# new_task(db, "Walk the duck", 2, 50)

#populate_dates(db)

tasks = db.execute("SELECT * FROM tasks")
dates = db.execute("SELECT * FROM dates")
puts tasks
puts dates