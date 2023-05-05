Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:id", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:id", { :controller => "photos", :action => "show" })
end
