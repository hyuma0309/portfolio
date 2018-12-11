class BookmarksController < ApplicationController
  protect_from_forgery except: :create

  def index
    
  end
  
  def create
    movie_id = params[:movie_id]
    if user_signed_in?
      user = current_user
      bookmark = Bookmark.find_or_create_by(movie_id: movie_id, user_id: user.id)
      bookmark.user = user
      bookmark.movie = Movie.find(movie_id)
      bookmark.save 
      redirect_back(fallback_location: root_path)
    else
      session[:after_login_to_add_bookmark] = {
        controller_name: controller_name,
        action_name: action_name,
        params: {movie_id: movie_id}
      }
      redirect_to '/users/sign_in'
    end
  end
  
  def destroy
    movie_id = params[:movie_id]
    user=current_user
    if bookmark = Bookmark.find_by(movie_id: movie_id, user_id: user.id)
    bookmark.delete
    redirect_to '/bookmarks'
  end
  end

  def after_login_to_add_bookmark
    if session[:after_login_to_add_bookmark]
      @back_controller = session[:after_login_to_add_bookmark]['controller_name']
      @back_action = session[:after_login_to_add_bookmark]['action_name']
      @params = session[:after_login_to_add_bookmark]['params']
      session[:after_login_to_add_bookmark] = nil
      render :after_login_to_add_bookmark, layout: false
    else
      redirect_to '/'
    end
  end

end
