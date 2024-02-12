Rails.application.routes.draw do

  #User paths
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  post("/add_user", { :controller => "users", :action => "create"})
  get("/users/:path_username", { :controller => "users", :action => "show"})
  #post("users/:path_username", { :controller => "users", :action => "update"})

  #Photo paths
  get("/photos", { :controller => "photos", :action => "index" })
  post("/insert_photo_record", {:controller => "photos", :action => "create"})
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  post("/update_photo/:path_id", { :controller => "photos", :action => "update"})




end
