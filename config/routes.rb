Rails.application.routes.draw do

  #User paths
  get("/", { :controller => "users", :action => "list" })
  get("/users", { :controller => "users", :action => "list" })
  post("/add_user", { :controller => "users", :action => "create"})





end
