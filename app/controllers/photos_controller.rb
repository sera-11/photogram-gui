class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/index" })
  end

  def create
    @the_photo = Photo.new
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.owner_id = params.fetch("input_owner_id")

    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos", { :notice => "Photo created successfully," })
    else
      redirect_to("/photos", { :notice => "Photo failed to created successfully," })
    end
  end

  def show
    # Paramters: { "path_username" => username }
    id = params.fetch("path_id")
    @the_photo = Photo.find(id)

    #OR
    #@the_user = matching_usernames.first

    if @the_photo.id == nil
      redirect_to("/photos")
    else
      render({ :template => "photo_templates/show" })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)

    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
 
    if @the_photo.valid?
      @the_photo.save
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo updated successfully." })
    else
      redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo failed to update successfully." })
    end
  end

  def destroy

    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)

    @the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )

  end

  def add_comment
    @the_comment = Comment.new
    @the_comment.photo_id = params.fetch("input_photo_id")
    @the_comment.author_id = params.fetch("input_author_id")
    @the_comment.body = params.fetch("input_comment")

    if @the_comment.valid?
      @the_comment.save
      redirect_to("/photos/#{@the_comment.photo_id}", { :notice => "Comment created successfully," })
    else
      redirect_to("/photos/#{@the_comment.photo_id}", { :notice => "Comment failed to created successfully," })
    end
  end


end
