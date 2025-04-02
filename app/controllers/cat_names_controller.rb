class CatNamesController < ApplicationController
  def new
    @form = CatNameForm.new(session[:cat_registration]&.slice(:name, :age, :cat_image) || {})
  end

  def create
    @form = CatNameForm.new(name_info_params.merge(user_id: current_user.id))

    if @form.valid?
      # 画像のキャッシュを保持する
      if params[:cat_name_form][:cat_image].present?
        uploader = CatImageUploader.new
        uploader.cache!(params[:cat_name_form][:cat_image])  # 画像をキャッシュ
        session[:cat_registration] = @form.attributes.merge(cat_image: uploader.cache_name)
      else
        session[:cat_registration] = @form.attributes
      end

      redirect_to new_food_name_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def name_info_params
    params.require(:cat_name_form).permit(:name, :age, :user_id, :cat_image)
  end
end
