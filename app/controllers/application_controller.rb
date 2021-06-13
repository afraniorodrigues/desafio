# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds

  protected

  def configure_permitted_parameters
    Rails.logger.info 'in ApplicationController.rb configure_permitted_parameters!'
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[cpf telefone])
  end
end
