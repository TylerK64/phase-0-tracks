require 'sqlite3'

def new_task(db, table, task, location, due_date)
  db.execute()
end

db = SQLite3::Database.new("task_list.db")
db.results_as_hash = true

create_dates_table = <<-SQL
  CREATE TABLE IF NOT EXISTS dates (
    id INTEGER PRIMARY KEY,
    dates TEXT
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

db.execute(create_tasks_table)

tasks = db.execute("SELECT * FROM tasks")