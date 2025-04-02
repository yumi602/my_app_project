class FoodNamesController < ApplicationController
  def new
    @form = FoodNameForm.new
  end

  def create
    @form = FoodNameForm.new(food_info_params)

    if @form.valid?
      session[:cat_registration] ||= {}
      session[:cat_registration].merge!(
      food: @form.food,
      body: @form.body
      )
      if params[:food_name_form][:food_image].present?
        uploader = FoodImageUploader.new
        uploader.cache!(params[:food_name_form][:food_image])
        session[:cat_registration][:food_image] = uploader.cache_name
      end

      redirect_to new_cat_info_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def food_info_params
    params.require(:food_name_form).permit(:food, :body, :food_image)
  end
end
