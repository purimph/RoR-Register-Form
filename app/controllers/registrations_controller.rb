class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 5)
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

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    alert = "Registration was successfully deleted."
    redirect_to registrations_path, notice: 'Registration was successfully deleted.'
  end

  def confirm_modal
    @registration = Registration.find(params[:id])
    render turbo_stream: turbo_stream.replace("modal", partial: "modal_confirm", locals: { registration: @registration })
  end

  def register_modal
    @registration = Registration.new
    render turbo_stream: turbo_stream.replace("modal", partial: "modal_register", locals: { registration: @registration })
  end

  private

  def sort_column
    Registration.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :birthday, :gender, :email, :phone_number, :subject)
  end
end
