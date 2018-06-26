require_relative 'config/environment'

class App < Sinatra::Base

  get "/" do
    erb :new
  end

  post "/student" do
    @student = Student.new(params[:student]) #<--This takes all of the paramaters within student key value and passes them in to create a new student
      params[:student][:courses].each do |details| #<--this iterates over all of the hashes in the array of courses from the form and creates a new course object with those details 
        Course.new(details)
      end

      @courses = Course.all
      erb :student
  end

end
