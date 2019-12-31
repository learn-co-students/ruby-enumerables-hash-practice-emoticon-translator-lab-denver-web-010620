# require modules here
require "yaml"
require "pp"

def transform_data(data)
  transformed_data = {:get_meaning => {}, :get_emoticon => {}}

  data.each do |key, value|
    transformed_data[:get_meaning].merge!({value[1] => key})
    transformed_data[:get_emoticon].merge!({value[0] => value[1]})
  end

  return transformed_data
end

def load_library(file_path)
  data = nil

  data = YAML.load_file(file_path)
  data = transform_data(data)
  #pp data

  return data
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_library = load_library (file_path)

  if emoticon_library[:get_emoticon].has_key?(english_emoticon) then
    return emoticon_library[:get_emoticon][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, japanese_emoticon)
  emoticon_library = load_library (file_path)

  if emoticon_library[:get_meaning].has_key?(japanese_emoticon) then
    return emoticon_library[:get_meaning][japanese_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
