class StaffsController < ApplicationController
  # GET /staffs
  # GET /staffs.json
  def index
    @staffs = Staff.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staffs }
    end
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
    @staff = Staff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staff }
    end
  end

  # GET /staffs/new
  # GET /staffs/new.json
  def new
    @staff = Staff.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staff }
    end
  end

  # GET /staffs/1/edit
  def edit
    @staff = Staff.find(params[:id])
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(params[:staff])

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render json: @staff, status: :created, location: @staff }
      else
        format.html { render action: "new" }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staffs/1
  # PUT /staffs/1.json
  def update
    @staff = Staff.find(params[:id])

    respond_to do |format|
      if @staff.update_attributes(params[:staff])
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy

    respond_to do |format|
      format.html { redirect_to staffs_url }
      format.json { head :no_content }
    end
  end

  def login
    if authenticate(params[:email], params[:password])
      redirect_to patients_path
    else
      flash[:error] = "Invalid email and password combination."
      redirect_to login_staff_path
    end
  end

  private

  def authenticate(email, password)
    employee = Staff.where("email = ? AND password = ?", email, password)
    if employee.blank?
      return false
    else
      session[:employee_id] = employee.id
      session[:firstname] = employee.firstname
      session[:lastname] = employee.lastname
      return true
    end
  end
end
