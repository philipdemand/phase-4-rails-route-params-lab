class StudentsController < ApplicationController

  def index
    if params[:name]
      query = "%#{params[:name]}%"  # Create a SQL LIKE query pattern
      students = Student.where("first_name LIKE ? OR last_name LIKE ?", query, query)
    else
      students = Student.all
    end

    render json: students
  end

  # def index
  #   students = Student.all
  #   render json: students
  # end

  def show
    students = Student.find(params[:id])
    render json: students
  end

end
