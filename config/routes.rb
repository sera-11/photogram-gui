Rails.application.routes.draw do

  #User paths
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  post("/add_user", { :controller => "users", :action => "create"})
  get("/users/:path_username", { :controller => "users", :action => "show"})

  #Photo paths
  get("/photos", { :controller => "photos", :action => "index" })
  post("/insert_photo_record", {:controller => "photos", :action => "create"})




end
