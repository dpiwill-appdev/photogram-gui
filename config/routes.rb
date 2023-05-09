Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:id", { :controller => "photos", :action => "show" })

  get("/photos/:id/edit", { :controller => "photos", :action => "edit" })

  post("/photos", { :controller => "photos", :action => "create" })

  patch("/photos/:id", { :controller => "photos", :action => "update" })

  delete("/delete_photo/:id", { :controller => "photos", :action => "destroy" })

  post("/comments", { :controller => "comments", :action => "create" })
end
