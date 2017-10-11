require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'models/student.rb'

get '/' do
  @students = Student.find_all
  erb(:index)
end

get '/add' do
  erb(:add)
end

post '/' do
  @student = Student.new(params)
  @student.save
  erb(:added)
end

get '/update/:id' do
  @student = Student.find(params['id'])
  erb(:update)
end

post '/update/:id' do
  @student = Student.new(params)
  @student.update
  erb(:updated)
end

get '/delete/:id' do
  student = Student.find(params[:id])
  student.delete
  erb(:deleted)
end
