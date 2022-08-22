class ApplicationController < ActionController::Base
	#Paramentro Permissão do Devise
	before_action :configure_permitted_parameters, if: :devise_controller?
	#Escolher Layouts pelo Devise
	layout :layout_by_resource

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password, :name])
	end

	def layout_by_resource
		if devise_controller? && resource_name == :admin
			"backoffice_devise"
		else
			"application"
		end
	end
end
