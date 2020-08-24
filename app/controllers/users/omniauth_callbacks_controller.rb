class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
    def facebook
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
        else
            flash[:error] = "There was a problem signing in through Facebook"
            redirect_to new_user_registration_url
        end
    end

    def github
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
        else
            flash[:error] = "There was a problem signing in through Github"
            redirect_to new_user_registration_url
        end
    end

    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            set_flash_message(:notice, :success, kind: "GoogleOauth2") if is_navigational_format?
        else
            flash[:error] = "There was a problem signing in through Google"
            redirect_to new_user_registration_url
        end
    end

    def failure
        flash[:error] = "There was a problem signing you in. Please register or try signing in later."
        redirect_to new_user_registration_url
    end
end
