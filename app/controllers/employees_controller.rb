class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @departments = Department.all
  end

  # GET /employees/1/edit
  def edit
    @departments = Department.all
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to root_path, notice: "Employee was successfully created"
    else
      @departments = Department.all
      render "new"
    end

  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to root_path, notice: "Employee was successfully updated"
    else
      render "edit"
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to root_path, notice: "Employee was successfully deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find_by(id: params[:id])
      raise "Employee not found" unless @employee.present?
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :designation, :email, :department_id)
    end
end
