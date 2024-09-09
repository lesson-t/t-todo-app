class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
        @profile = current_user.profile
        @user = current_user
    end

    def edit
        if current_user.profile.present?
            @profile = current_user.profile
        else
            @profile = current_user.build_profile
        end
    end

    def update
    end

    private
    def profile_params
        params.require(:profile).permit(
            :nickname,
            :introduction,
            :gender,
            :birthday,
            :subscribe
            # ,:avatar
        )
    end
end