module FishHelper
    
  def display_fish
    fishes = ""
    if @fishes.any? 
         10.times do 
            fishes << image_tag("/assets/tank/#{@fishes.sample.image_path}", class: "tank-image")
         end 
         fishes.html_safe
      end 
    end

    def display_user_fish(collection)
        if collection.empty? 
            content_tag(:div, class: "user-box") {
            concat content_tag(:h1, "No fish found!")
            concat content_tag(:h1, "Go roll for some!")
            }.html_safe 
        else
            content_tag(:div, class: "user-box") {
                concat content_tag(:h1, "My fish") 
                concat tag(:br) 
                concat tag(:br) 
                collection.collect do |f|
                    concat content_tag(:figure, class: "snip1336") {
                        concat image_tag("underwater-bg.jpeg",size: "320")
                        concat content_tag(:figcaption) { 
                            concat image_tag("/assets/tank/#{f.fish.image_path}",alt: "profile-sample4", class: "profile")
                            concat content_tag(:h2, !f.custom_name? ? f.fish.name : f.custom_name)
                            concat button_to "Edit name", {:controller => "fishes", :action => "edit", id: f.id},class: "edit-fishname", params: {uf_id: f.id}, :method=>:get
                            concat tag(:br)
                            concat content_tag(:span) {
                                concat tag(:br)
                                concat button_to 'X', {:controller => "fishes", :action => "destroy", id: f.id}, params: {uf_id: f.id},class: "x-button", data: {confirm: "Are you sure you want to delete this fish?" }, :method=>:delete
                            }
                        }
                    }
                end.join.html_safe     
            }
        end
    end
end
