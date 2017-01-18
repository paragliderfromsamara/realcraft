module PagesHelper
  def production_photos(ph_name, preview_size = "small")
    path_name = "/production_photos"
    return {url: "#{path_name}/#{ph_name}_#{preview_size}.jpg", list: "[#{path_name}/#{ph_name}_small.jpg, small], [#{path_name}/#{ph_name}_medium.jpg, medium], [#{path_name}/#{ph_name}_large.jpg, large], [#{path_name}/#{ph_name}_xlarge.jpg, xlarge]"}
  end
end
