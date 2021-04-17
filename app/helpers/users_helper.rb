module UsersHelper

    def update_points
        if logged_in?  
             p = current_user.points + 100 
            current_user.update(points: p)
        end
    end

    def show_points
        if logged_in?
            content_tag(:p, "Sea Dollars: #{current_user.points}")
        end
    end

    def show_avatar(user)
        if user.avatar.attached?
            image_tag(user.avatar, size: "200", class: "profile-1")
        else
            image_tag("profile-jelly.png", class: "profile-1", size: "200")
        end
    end

    def show_friends_mini(collection)
        if collection.empty?
            concat content_tag(:h2, "Friends")
            link_to "Search for friends!", users_path, class: "new-message-button"
        else
            content_tag(:p) {
                concat content_tag(:h2, "Friends")
            collection.each  do |f|
                concat content_tag(:div, class: "mini-friend-card") {
                concat content_tag(:div, class: "inner-mini-friend-card") {
                  if !f.avatar.attached?
                    concat image_tag("profile-jelly.png", alt: "profile-sample4", class: "mini-friend-avatar", size: "100")
                  else
                    concat image_tag(f.avatar, class: "mini-friend-avatar", alt: "profile-sample4", size: "100")
                  end
                  concat content_tag(:p, f.username, class: "mini-friend-card-name")
                  concat tag(:br)
                    }
                 }
            end.join.html_safe
        }
        end
    end
end
