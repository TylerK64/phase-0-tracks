require 'sqlite3'

#SELECT * FROM tasks JOIN locations ON tasks.location_id = locations.id JOIN dates ON tasks.due_date_id = dates.id;
#delete previous line; used for personal testing

def db_check(db, task_info) # If exact task, location, & due date already exist in db return false. Otherwise add location, location_id, date_id to respective tables.
  task_check = <<-SQL
     SELECT tasks.task, locations.location, dates.date 
     FROM tasks JOIN locations ON tasks.location_id = locations.id 
     JOIN dates ON tasks.due_date_id = dates.id 
     WHERE tasks.task = (?) AND locations.location = (?) AND dates.date = (?)
  SQL
  task_new = db.execute(task_check, [task_info[0], task_info[1], task_info[2]])

  if task_new.empty? # Check + add new location and/or date data if no exact task match; After add task, location_id and due_date_id to tasks
    location_new = db.execute("SELECT * FROM locations WHERE location = (?)", task_info[1])
    if location_new.empty?
      db.execute("INSERT INTO locations (location) VALUES (?)", task_info[1])
    end
    date_new = db.execute("SELECT * FROM dates WHERE date = (?)", task_info[2])
    if date_new.empty?
      db.execute("INSERT INTO dates (date) VALUES (?)", task_info[2])
    end
    location_id = db.execute("SELECT locations.id FROM locations WHERE location = (?)", task_info[1]).flatten
    date_id = db.execute("SELECT dates.id FROM dates WHERE date = (?)", task_info[2]).flatten
    db.execute("INSERT INTO tasks (task, location_id, due_date_id) VALUES (?, ?, ?)", [task_info[0], location_id[0], date_id[0]])
  elsif !task_new.empty?
    return false
  end
  # return true
end

def populate_dates(db) #Populate dates only for current year. Unnecessary method, used for neater table organization.
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

def task_split(db, task_new)
  task_info = task_new.split(',')
  if task_info.length != 3
    puts "Sorry, not valid input. Try again."
  else
    task_info[1].strip!
    task_info[2].strip!
  end
  return task_info
end

def update_task(db, task_old, task_update)
  tasks = db.execute("SELECT tasks.task, location_id, due_date_id FROM tasks WHERE tasks.task = (?)", task_old)
  if tasks.empty?
    puts "No such task exists, try entering a different task description."
  elsif tasks.length == 1
    tasks.flatten!
    db.execute("UPDATE tasks SET task = (?) WHERE task = (?) AND location_id = (?) AND due_date_id = (?)", [task_update, task_old, tasks[1], tasks[2]] )
  elsif tasks.length > 1
    tasks_update = db.execute("SELECT tasks.task, locations.location, dates.date FROM tasks JOIN locations ON tasks.location_id = locations.id JOIN dates ON tasks.due_date_id = dates.id WHERE tasks.task = (?)", task_old)
    task_num = multiple_tasks(tasks_update)
    p tasks
    task_new = tasks[task_num]
    p task_new
    db.execute("UPDATE tasks SET task = (?) WHERE task = (?) AND location_id = (?) AND due_date_id = (?)", [task_update, task_old, task_new[1], task_new[2]] )
  end
end

def search(db, query)
end

def multiple_tasks(task_arr)
  puts "There are multiple tasks which fit the entered description, which would you like to choose? Please enter the number of the corresponding output line:"
  task_arr.each do |task|
    puts "Task: #{task[0]} at Location: #{task[1]} with Due Date: #{task[2]}."
  end
  task_num = gets.chomp.to_i
  task_num -= 1
  return task_num
end

create_dates_table = <<-SQL
  CREATE TABLE IF NOT EXISTS dates (
    id INTEGER PRIMARY KEY,
    date DATE
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
    task_info = task_split(db, task_new)
    task_check = db_check(db, task_info)
    if task_check == false
      puts "Entered task already exists. Try entering some different values."
    end
  elsif response == "update task"
    puts "Please enter the name of the task you would like to edit."
    task_old = gets.strip
    puts "Please enter the updated task information:"
    task_update = gets.strip
    update_task(db, task_old, task_update)
  elsif response == "search"
    #add code for searching the db later
  else
    puts "Sorry, not a valid input. Type 'q' to quit."
  end
end