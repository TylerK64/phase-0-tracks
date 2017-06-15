# require gems
require 'sinatra'
require "sinatra/reloader" if development?
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  campus = params[:campus]
  students = db.execute("SELECT * FROM students WHERE campus IN (?)", campus)
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  id = params[:id].to_i
  student = db.execute("SELECT * FROM students WHERE id=?", id)[0]
  p student
  student.to_s
end

get '/contact' do
  address = "123 Main Street"
  "The address is located at #{address}."
end

get '/great_job/' do
  person = params[:name]
  if person
    "Good job, #{person}!"
  else
    "Good job!"
  end
end

get '/numbers/:num1/:num2' do
  total = params[:num1].to_i + params[:num2].to_i
  total.to_s
end