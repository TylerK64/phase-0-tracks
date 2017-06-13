require 'sqlite3'

def db_check(db, task_info) # If exact task, location, & due date already exist in db return false. Otherwise add location, location_id, date_id to respective tables.
  task_check = <<-SQL
     SELECT tasks.task, locations.location, dates.date 
     FROM tasks JOIN locations ON tasks.location_id = locations.id 
     JOIN dates ON tasks.due_date_id = dates.id 
     WHERE tasks.task = (?) AND locations.location = (?) AND dates.date = (?)
  SQL
  task_new = db.execute(task_check, [task_info[0], task_info[1], task_info[2]])

  if task_new.empty? # Check & add new location and/or date data if no exact task match; After add task, location_id and due_date_id to tasks
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

def update_task(db, task_old, task_update)
  tasks = db.execute("SELECT location_id, due_date_id FROM tasks WHERE tasks.task = (?)", task_old)
  if tasks.empty?
    puts "No such task exists, try entering a different task description."
    # return false
  elsif tasks.length == 1
    tasks.flatten!
    db.execute("UPDATE tasks SET task = (?) WHERE task = (?) AND location_id = (?) AND due_date_id = (?)", [task_update, task_old, tasks[0], tasks[1]] )
  elsif tasks.length > 1
    task_num = multiple_tasks(db, task_old)
    if task_num < 0 || task_num > tasks.length
      puts "Not a valid task entry, try a different number."
      return false
    end
    task_new = tasks[task_num]
    db.execute("UPDATE tasks SET task = (?) WHERE task = (?) AND location_id = (?) AND due_date_id = (?)", [task_update, task_old, task_new[0], task_new[1]] )
  end
end

def delete_task(db, task)
  tasks = db.execute("SELECT tasks.id FROM tasks WHERE tasks.task = (?)", task)
  if tasks.empty?
    puts "No such task exists, try entering a different task description."
  elsif tasks.length == 1
    tasks.flatten!
    db.execute("DELETE FROM tasks WHERE id = (?)", tasks[0])
  elsif tasks.length > 1
    task_num = multiple_tasks(db, task)
    if task_num < 0 || task_num > tasks.length
      puts "Not a valid task entry, try a different number."
      return false
    end
    task_delete = tasks[task_num]
    db.execute("DELETE FROM tasks WHERE id = (?)", task_delete[0]) 
  end
end

def search(db, query)
  search_info = query.split(',')
  if search_info.length != 2
    puts "Sorry, the search query is invalid input. Please try again."
    return false
  else
    search_info[1].strip!
    if search_info[1] == "task"
      tasks = db.execute("SELECT tasks.task, locations.location, dates.date FROM tasks JOIN locations ON tasks.location_id = locations.id JOIN dates ON tasks.due_date_id = dates.id WHERE tasks.task = (?)", search_info[0])
      if tasks.empty?
        puts "No results found for given task. Maybe try a different search term."
      else
        tasks.each do |task|
          puts "Task: #{task[0]} at Location: #{task[1]} with Due Date: #{task[2]}."
        end
      end
    elsif search_info[1] == "location"
      locations = db.execute("SELECT tasks.task, locations.location, dates.date FROM tasks JOIN locations ON tasks.location_id = locations.id JOIN dates ON tasks.due_date_id = dates.id WHERE locations.location = (?)", search_info[0])
      if locations.empty?
        puts "No results found for given location. Maybe try a different search term."
      else
        locations.each do |location|
          puts "Task: #{location[0]} at Location: #{location[1]} with Due Date: #{location[2]}."
        end
      end
    elsif search_info[1] == "date"
      dates = db.execute("SELECT tasks.task, locations.location, dates.date FROM tasks JOIN locations ON tasks.location_id = locations.id JOIN dates ON tasks.due_date_id = dates.id WHERE dates.date = (?)", search_info[0])
      if dates.empty?
        puts "No results found for given date. Maybe try a different search term."
      else
        dates.each do |date|
          puts "Task: #{date[0]} at Location: #{date[1]} with Due Date: #{date[2]}."
        end
      end
    else
      puts "Inputted data type is invalid. Try 'task', 'location', or 'date'"
      return false
    end
    # return true
  end
end

def multiple_tasks(db, task_query)
  task_arr = db.execute("SELECT tasks.task, locations.location, dates.date FROM tasks JOIN locations ON tasks.location_id = locations.id JOIN dates ON tasks.due_date_id = dates.id WHERE tasks.task = (?)", task_query)
  puts "There are multiple tasks which fit the entered description, which would you like to choose? Please enter the number of the corresponding output line:"
  task_arr.each do |task|
    puts "Task: #{task[0]} at Location: #{task[1]} with Due Date: #{task[2]}."
  end
  task_num = gets.chomp.to_i
  return task_num - 1
end

def task_split(db, task_new) # Splits input for new task into an array
  task_info = task_new.split(',')
  if task_info.length != 3
    puts "Sorry, the new task information is invalid input. Please try again."
    return false
  else
    task_info[1].strip!
    task_info[2].strip!
  end
  return task_info
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

db.execute(create_tasks_table)
db.execute(create_dates_table)
db.execute(create_locations_table)


## Driver code logic ##
loop do
  puts "Please enter 'new task', 'update task', 'delete task', or 'search' to add, edit, delete, or find a task. Or type 'q' to quit."
  response = gets.strip
  if response == 'q'
    break
  elsif response == "new task"
    puts "Please enter the task, the location of the task, and the due date (separated by commas):"
    task_new = gets.strip
    task_info = task_split(db, task_new)
    task_check = db_check(db, task_info)
    if task_check == false
      puts "Entered task already exists. Try entering some different values."
    end
  elsif response == "update task"
    puts "Please enter the name of the task you would like to edit:"
    task_old = gets.strip
    puts "Please enter the updated task information:"
    task_update = gets.strip
    update_task(db, task_old, task_update)
  elsif response == "delete task"
    puts "Please enter the name of the task you would like to delete:"  
    task_delete = gets.strip
    delete_task(db, task_delete)
  elsif response == "search"
    puts "Please enter your search query, along with the type of data provided (eg: task, location, date) and separated with a comma:"
    search_query = gets.strip
    search(db, search_query)
  else
    puts "Sorry, not a valid input. Type 'q' to quit."
  end
end