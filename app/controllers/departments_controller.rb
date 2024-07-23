class DepartmentsController < ApplicationController  
  before_action :set_department, only: %i[ edit update destroy ]
  
  #GET /depatments
  def index
    @departments = Department.all
  end

  #GET /department/new
  def new
    @department = Department.new
  end

  #GET /department/1/edit
  def edit
  end

  # POST /departments
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path, notice: "Department was successfully created"
    else
      render "new"
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @department.update(department_params)
      redirect_to departments_path, notice: "Department was successfully updated"
    else
      render "edit"
    end
  end

  # DELETE /employees/1
  def destroy
    @department.destroy
    redirect_to departments_path, notice: "Department was successfully deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find_by(id: params[:id])
      raise "Department not found" unless @department.present?
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:name)
    end

end
