class CatsController < ApplicationController
  def index
    @cats = Cat.includes(:user).where(user_id: current_user.id)
  end
end
