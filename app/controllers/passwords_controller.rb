class PasswordsController < ApplicationController
  before_action :set_password, only: [:show, :edit, :update, :destroy]

  before_action :application

  before_action :require_password, only: [:show, :edit]

  # GET /passwords
  # GET /passwords.json
  def index
    @passwords = application.passwords.all
  end

  # GET /passwords/1
  # GET /passwords/1.json
  def show
  end

  # GET /passwords/new
  def new
    @password = application.passwords.new
  end

  # GET /passwords/1/edit
  def edit
  end

  # POST /passwords
  # POST /passwords.json
  def create
    @password = application.passwords.new(password_params)

    respond_to do |format|
      if @password.save
        format.html { redirect_to [application, @password], notice: 'Password was successfully created.' }
        format.json { render action: 'show', status: :created, location: @password }
      else
        format.html { render action: 'new' }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passwords/1
  # PATCH/PUT /passwords/1.json
  def update
    respond_to do |format|
      if @password.update(password_params)
        format.html { redirect_to [application, @password], notice: 'Password was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1
  # DELETE /passwords/1.json
  def destroy
    @password.destroy
    respond_to do |format|
      format.html { redirect_to passwords_url }
      format.json { head :no_content }
    end
  end

  private

  def set_application
    @application ||= current_user.applications.find(params[:application_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_password
    @password = application.passwords.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def password_params
    params.require(:password).permit(:title, :description, :password)
  end

  def application
    @application = current_user.applications.find(params[:application_id])
  end
end
