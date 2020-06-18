# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :login_done, only: %i[new create]
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
