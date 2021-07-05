require "yaml"
require "pry"

def load_library(file)
   result = {
   'get_meaning' => {},
   'get_emoticon' => {}
 }
  emoticons = YAML.load_file(file)
  japanese_emoticon = {}
  emoticons.map {
    |english_value,emoticon|
    result['get_emoticon'][emoticon[0]] = emoticons[english_value][1]
    result['get_meaning'][emoticon[1]] = english_value
  }
   return result
end

def get_japanese_emoticon(file, emoticon)
  japanese_emoticons = load_library(file)
sorry_message = "Sorry, that emoticon was not found"

if emoticon = japanese_emoticons['get_emoticon'][emoticon] 
  return emoticon
   
else
  return sorry_message
end
end

def get_english_meaning(file, emoticon)
  enlish_meaning = load_library(file)
  apology = "Sorry, that emoticon was not found"
  if emoticon = enlish_meaning['get_meaning'][emoticon]
     return emoticon
  else
    return apology
  end
  
end
 