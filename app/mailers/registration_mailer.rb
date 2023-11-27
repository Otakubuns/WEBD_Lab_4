class RegistrationMailer < ApplicationMailer

  def register
    params[:user]

    mail to: params[:user].email
  end
end
