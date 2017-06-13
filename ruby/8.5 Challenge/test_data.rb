require 'sqlite3'
db = SQLite3::Database.new("task_list.db")
  
tasks = db.execute("SELECT tasks.task FROM tasks WHERE tasks.task = (?)", "walk the dog")
#p tasks

task_update = "walk the dog"
tasks_update = db.execute("SELECT tasks.task, locations.location, dates.date FROM tasks JOIN locations ON tasks.location_id = locations.id JOIN dates ON tasks.due_date_id = dates.id WHERE tasks.task = (?)", task_update)

tasks_update.each do |task|
  puts "task: #{task[0]} at location: #{task[1]} due on date: #{task[2]}."
  puts "hello new line"
end

def add(x, y)
  x + y
end

def add_then_multiply(x, y)
  a = add(x, y)
  b = a * x * y
  return b
end

# c = add_then_multiply(2, 3)
# p c