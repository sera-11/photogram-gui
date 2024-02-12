class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render( { :template => "photo_templates/index"})
  end

  def create
    @the_photo = Photo.new
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.owner_id = params.fetch("input_owner_id")
    
    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos", { :notice => "Photo created successfully,"})
    else
      redirect_to("/photos", { :notice => "Photo failed to created successfully,"})
    end
  end

  def show
    # Paramters: { "path_username" => username }
    id = params.fetch("path_id")
    matching_records = User.where({ :id => id })

    @the_photo = matching_records.at(0) 
    #OR
    #@the_user = matching_usernames.first

    if @the_photo == nil
      redirect_to("/")
    else
      render({ :template => "photo_templates/show"})
    end
  end

end
