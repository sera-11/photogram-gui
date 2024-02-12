class PhotosController < ApplicationController

  def index
    @list_of_photos = Photo.all.order({ :created_at => :asc })

    render( { :template => "photo_templates/index"})
  end

end
