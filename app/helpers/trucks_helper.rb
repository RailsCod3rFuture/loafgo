module TrucksHelper

  def static_map_for(location, options = {})
    params = {
        :center => [location.lat, location.lon].join(","),
        :zoom => 15,
        :size => "300x300",
        :markers => [location.lat, location.lon].join(","),
        :sensor => true
    }.merge(options)

    query_string = params.map {|k, v| "#{k}=#{v}"}.join("&")
    image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string}", :alt => location.current_location_title, class: 'img-fluid img-rounded'
  end
end
