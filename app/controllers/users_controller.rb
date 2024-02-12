class UsersController < ApplicationController
  def index

    @list_of_users = User.all.order({ :username => :asc })

    
    render({ :template => "user_templates/index" })

  end

  def create
    @the_user = User.new
    @the_user.username = params.fetch("input_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users", { :notice => "User created successfully,"})
    else
      redirect_to("/users", { :notice => "User failed to created successfully,"})
    end
  end

  def show
    # Paramters: { "path_username" => username }
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0) 
    #OR
    #@the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/")
    else
      render({ :template => "user_templates/show"})
    end
    
  end

  
end
