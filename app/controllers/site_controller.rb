class SiteController < ApplicationController
  def index
    if current_user
      redirect_to user_projects_path(current_user.id)
    end    
  end
end
