class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	# 「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装
	#before_action :authenticate_user!
	def after_sign_in_path_for(resource)
    	# mypage_root_path # ログイン後に遷移するpathを設定
  	end

	def after_sign_out_path_for(resource)
		root_path # ログアウト後に遷移するpathを設定
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
		devise_parameter_sanitizer.permit(:sign_up, keys:  [:name])
	end

end
