module BuildMarkers
  extend ActiveSupport::Concern

  private
  def set_markers

    @hash = Gmaps4rails.build_markers(@map_posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "posts/infowindow", locals: { post: post })

      marker.json({ id: post.id, })
    end
    
  end

end