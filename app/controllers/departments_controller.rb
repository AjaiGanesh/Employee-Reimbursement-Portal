class DepartmentsController < ApplicationController  
  
  #GET /depatments
  def index
    @depatments = Departments.all
  end
end
