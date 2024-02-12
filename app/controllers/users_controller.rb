class UsersController < ApplicationController
  def list

    @list_of_users = User.all.order({ :created_at => :desc })

    
    render({ :template => "user_templates/list" })

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
end
