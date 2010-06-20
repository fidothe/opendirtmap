xml.instruct!
xml.kml :xmlns => "http://www.opengis.net/kml/2.2" do |kml|
  colours = {
    0 => "8e004a",
    1 => "b10103",
    2 => "ea1117",
    3 => "f05215",
    4 => "f07609",
    5 => "eda000",
    6 => "ffc100",
    7 => "fdd20b",
    8 => "ab9a00",
    9 => "467319",
    10 => "006158",
    11 => "00463f",
    12 => "2d258a",
    13 => "221c70",
    14 => "221c5a"
  }
  (0..14).each do |ph|
    kml.Style(:id => "ph_#{ph}") do |style|
      style.IconStyle do |is|
        is.Icon do |icon|
          is.color colours[ph]
          icon.href "http://maps.google.com/mapfiles/kml/shapes/shaded_dot.png"
        end
      end
    end
  end
  
  @dirt_tagged_photos.each do |photo|
    soil_ph_tag = photo.machine_tags.match(/soil:pH=([0-9]+)([0-9]{2})/)
    ph = soil_ph_tag.nil? ? "0" : "#{soil_ph_tag[1]}.#{soil_ph_tag[2]}".to_i
    kml.Placemark do |pm|
      pm.name photo.title
      pm.description "added by #{photo.ownername}"
      pm.styleUrl "ph_#{ph}"
      pm.Point do |point|
        point.coordinates "#{photo.longitude},#{photo.latitude},0"
      end
    end
  end
end
