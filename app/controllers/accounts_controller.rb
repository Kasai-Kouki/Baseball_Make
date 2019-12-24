class AccountsController < ApplicationController
before_action :login_required
    def show
        @member = current_member
    end

    def edit
      @member = current_member
    end

    def update
    @member = current_member
        @member.assign_attributes(account_params)
        if @member.save
          redirect_to :account,notice:"アカウント情報を更新した！"
        else
          render "edit"
        end
    end

    private

    def account_params
      params.require(:account).permit(:name,:teamname,:email,:password,:password_confirmation,:area,:category)
    end

end