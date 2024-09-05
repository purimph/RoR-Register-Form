class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to registrations_path, notice: 'Registration was successfully created.'
    else
      render :new
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
      redirect_to registrations_path, notice: 'Registration was successfully updated.'
    else
      render :edit
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :birthday, :gender, :email, :phone_number, :subject)
  end
end