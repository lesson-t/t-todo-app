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
        @profile = current_user.profile || current_user.build_profile
        @profile.assign_attributes(profile_params)
        if @profile.save
            redirect_to profile_path, notice: 'プロフィールを更新'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    private
    def profile_params
        params.require(:profile).permit(
            :nickname,
            :introduction,
            :gender,
            :birthday,
            :subscribe,
            :avatar
        )
    end
end