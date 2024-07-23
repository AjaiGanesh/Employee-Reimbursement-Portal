class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :set_departments, only: %i[ new create edit]

  # GET /employees
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    Rails.logger.info "Calling new condition"
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to root_path, notice: "Employee was successfully created"
    else
      Rails.logger.info "Calling create error condition"
      render :new
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

    def set_departments
      @departments = Department.all
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :designation, :email, :department_id)
    end
end
