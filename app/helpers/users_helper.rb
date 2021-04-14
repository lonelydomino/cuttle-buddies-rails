module UsersHelper
    def update_points
        if logged_in?  
             p = current_user.points + 100 
            current_user.update(points: p)
        end
    end
    def show_points
        if logged_in?
            content_tag(:p, "Points: #{current_user.points}")
        end
    end
    def show_avatar
        if current_user.avatar.attached?
            image_tag(current_user.avatar, size: "200")
        else
            image_tag("profile-jelly.png", size: "200")
        end
    end

    def show_friends_mini
        <% if @user.friends.empty? %>
            <%= form_with(url: users_path, method: :get) do |f|%>
              <%= f.hidden_field :search, value: "" %>
              <button class="new-message-button" type="submit">Search for friends!</button>
            <% end %>
          <% else %> 
            <% @user.friends.each do |f| %>
              <div class="mini-friend-card" >
                <div class="inner-mini-friend-card">
                  <% if !f.avatar.attached? %>
                    <%= image_tag("profile-jelly.png", alt: "profile-sample4", class: "mini-friend-avatar", size: "100") %>
                  <% else %>
                    <%= image_tag(f.avatar, class: "mini-friend-avatar", alt: "profile-sample4", size: "100") %>
                  <% end %>
                 <p class="mini-friend-card-name"> <%= f.username %></p><br>
                </div>
              </div>
            <% end %>
          <% end %>
    end
end
