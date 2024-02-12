Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "homepage" })

end
