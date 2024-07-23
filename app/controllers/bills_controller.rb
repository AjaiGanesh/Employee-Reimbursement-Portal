class BillsController < ApplicationController
  before_action :set_bill, only: %i[ show edit update destroy ]

  # GET /bills
  def index
    bills = Bill.all
    @bills = {total: bills.sum(:amount), data: bills}
  end

  # GET /bills/1
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    @employees = Employee.all
  end

  # GET /bills/1/edit
  def edit
    @employees = Employee.all
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)
    if @bill.save
      redirect_to bills_path, notice: "Bill was created Successfully"
    else
      render "new"
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      redirect_to bills_path, notice: "Bill was updated successfully"
    else
      render "edit"
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
    redirect_to bills_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find_by(id: params[:id])
      raise "Bill not found" unless @bill.present?
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:bill_type, :amount, :employee_id)
    end
end
