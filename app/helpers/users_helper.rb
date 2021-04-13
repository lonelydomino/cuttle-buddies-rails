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
end
