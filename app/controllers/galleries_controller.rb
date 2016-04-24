class GalleriesController < ApplicationController
  before_action :gallery_find, only: [:show,:destroy,:edit, :update]
  before_action :authenticate_user!, except: [:index]
  def index
    @galleries = Gallery.all.paginate(:page => params[:page], per_page: 10).order("created_at desc")


  end

  def new
    @gallery = current_user.galleries.new
  end
  
  def edit
  end

  def update
    if @gallery.update(gallery_params)
      if params[:images]
        params[:images].each do |image|
          @gallery.pictures.create(image: image)

        end

        
      end
      redirect_to @gallery
    else
      render 'edit'
    end
  end

  
  def show
    
  end
  def upvote
    @gallery = Gallery.find(params[:id])
    if current_user.liked? @gallery
      @gallery.downvote_by current_user
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      @gallery.upvote_by current_user
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    end
  end

  def create
  	@gallery = current_user.galleries.new(gallery_params)
  	if @gallery.save
      if params[:images]
        params[:images].each do |image|
          @gallery.pictures.create(image: image)

        end

        
      end
      redirect_to @gallery
  	else
      render 'new'
  	end

  end

  def destroy
    @gallery.destroy
    redirect_to galleries_path
    

  end


  private

  def gallery_params
  	params.require(:gallery).permit(:title, :description, :images)
  end


  def gallery_find
    @gallery = Gallery.find(params[:id])
  end
end
