xml.instruct!
xml.kml :xmlns => "http://www.opengis.net/kml/2.2" do |kml|
  @dirt_tagged_photos.each do |photo|
    puts photo.inspect
    kml.Placemark do |pm|
      pm.name photo.title
      pm.description "added by #{photo.ownername}"
      pm.Point do |point|
        point.coordinates "#{photo.longitude},#{photo.latitude},0"
      end
    end
  end
end
