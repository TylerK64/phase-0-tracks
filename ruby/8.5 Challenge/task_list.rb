require 'sqlite3'

def existsCheck(db, task_info)
end

def new_task(db, task_new, location, due_date)
  db.execute("INSERT INTO tasks (task, location_id, due_date_id) VALUES (?, ?, ?)", [task_new, location, due_date])
end

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

def new_task(db, task_new)
  task_info = task_new.split(',')
  if task_info.length != 3
    puts "Sorry, not valid input. Try again."
  else
    task_info[1].strip!
    task_info[2].strip!
    #db.execute("INSERT INTO tasks (task) VALUES (?)", task_info[0])
    p task_info
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
#db.results_as_hash = true

db.execute(create_tasks_table)
db.execute(create_dates_table)
db.execute(create_locations_table)

# new_task(db, "Walk the duck", 2, 50)

populate_dates(db)

tasks = db.execute("SELECT * FROM tasks")
dates = db.execute("SELECT * FROM dates")
#p tasks
#p dates


## Driver code logic ##
loop do
  puts "Please enter 'new task', 'update task', or 'search' to add, edit, or find a task. Or type 'q' to quit."
  response = gets.strip
  if response == 'q'
    break
  elsif response == "new task"
    puts "Please enter the task, the location of the task, and the due date (separated by commas)."
    task_new = gets.strip
    new_task(db, task_new)
  elsif response == "update task"
    #code for updating task      
  elsif response == "search"
    #add code for searching the db later
  else
    puts "Sorry, not a valid input. Type 'q' to quit."
  end
#task, the task location, and the due date (YYYY-MM-DD). Or type q to quit.
end