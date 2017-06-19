# require gems
require 'sinatra'
require "sinatra/reloader" if development?
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  @teachers = db.execute("SELECT * FROM teachers")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# add static resources

get '/teachers/new' do
  erb :new_teacher
end

post '/teachers' do
  teachers_table = <<-SQL
  CREATE TABLE IF NOT EXISTS teachers(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  campus VARCHAR(255),
  age int
  )
  SQL
  db.execute(teachers_table)
  db.execute("INSERT INTO teachers (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end