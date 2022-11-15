class Article < ApplicationRecord
  belongs_to :user

def show
  session[:pageviews_remaining] ||= 0
  cookies[:pageviews_remaining] ||= 0
  # render json: { session: session, cookies: cookies.to_hash }
  render json: {Article.find(params[:id]), session: session, cookies: cookies.to_hash }, status: :ok
end


  def author
    user.username
  end

  def preview
    content.split("\n")[1]
  end

  def date
    created_at.strftime('%B %e, %Y')
  end

end
