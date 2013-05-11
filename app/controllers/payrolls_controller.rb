class PayrollsController < ApplicationController
  # GET /payrolls
  # GET /payrolls.json
  def index
    @payrolls = Payroll.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payrolls }
    end
  end

  # GET /payrolls/1
  # GET /payrolls/1.json
  def show
    @payroll = Payroll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payroll }
    end
  end

  # GET /payrolls/new
  # GET /payrolls/new.json
  def new
    @payroll = Payroll.new
    @payroll.employee = Employee.find_by_id(params[:employee_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payroll }
    end
  end

  # GET /payrolls/1/edit
  def edit
    @payroll = Payroll.find(params[:id])
  end

  # POST /payrolls
  # POST /payrolls.json
  def create
    @payroll = Payroll.new(params[:payroll])

    respond_to do |format|
      if @payroll.save
        format.html { redirect_to @payroll, notice: 'Payroll was successfully created.' }
        format.json { render json: @payroll, status: :created, location: @payroll }
      else
        format.html { render action: "new" }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payrolls/1
  # PUT /payrolls/1.json
  def update
    @payroll = Payroll.find(params[:id])

    respond_to do |format|
      if @payroll.update_attributes(params[:payroll])
        format.html { redirect_to @payroll, notice: 'Payroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payrolls/1
  # DELETE /payrolls/1.json
  def destroy
    @payroll = Payroll.find(params[:id])
    @payroll.destroy

    respond_to do |format|
      format.html { redirect_to payrolls_url }
      format.json { head :no_content }
    end
  end
end
