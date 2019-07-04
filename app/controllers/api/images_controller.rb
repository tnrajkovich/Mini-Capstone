class Api::ImagesController < ApplicationController
  def index
    @images = Image.all

    if params[:url]
      @images = @images.where("name ILIKE ?", "%#{params[:url]}%")
    end

    render "index.json.jb"
  end

  def show
    @image = Image.find_by(id: params["id"].to_i)
    render "show.json.jb"
  end

  def create
    @image = Image.new(
      id: params["id"],
      image_url: params["image_url"],
    )
    if @image.save
      render "show.json.jb"
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @image = Image.find_by(id: params["id"])
    @image.id = params["id"] || @image.id
    @image.image_url = params["image_url"] || @image.image_url
    if @image.save
      render "show.json.jb"
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find_by(id: params["id"])
    @image.destroy
    render json: { message: "You have successfully deleted an image." }
  end
end
