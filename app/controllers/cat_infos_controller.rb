class CatInfosController < ApplicationController
  def new
    Rails.logger.debug "Session Data: #{session[:cat_registration].inspect}"
    data = session[:cat_registration]&.dup || {}

    if data["cat_image"].present?
      Rails.logger.debug "Restoring image from cache: #{data["cat_image"]}"
      uploader = CatImageUploader.new
      uploader.retrieve_from_cache!(data["cat_image"])
      data["cat_image"] = uploader
      Rails.logger.debug "Restored image from cache: #{uploader.url}"
    else
      Rails.logger.debug "No image cache found."
    end

    if data["food_image"].present?
      Rails.logger.debug "Restoring image from cache: #{data["food_image"]}"
      uploader = FoodImageUploader.new
      uploader.retrieve_from_cache!(data["food_image"])
      data["food_image"] = uploader
      Rails.logger.debug "Restored image from cache: #{uploader.url}"
    else
      Rails.logger.debug "No image cache found."
    end

    @form = CatInfoForm.new(data)
  end

  def create
    @form = CatInfoForm.new(session[:cat_registration])

    if @form.save
      session.delete(:cat_registration)
      redirect_to cats_path, notice: "猫の登録が完了しました！"
    else
      render :new, status: :unprocessable_entity
    end
end
