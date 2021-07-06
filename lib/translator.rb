require "yaml"

def load_library(path)
  library = YAML.load_file(path)

  new_lib = {}
  new_lib['get_meaning'] = {}
  new_lib['get_emoticon'] = {}

  library.each do |meaning, emoticons|
    w_emoticon = emoticons[0]
    j_emoticon = emoticons[1]
    new_lib['get_meaning'][j_emoticon] = meaning
    new_lib['get_emoticon'][w_emoticon] = j_emoticon
  end
  
  new_lib
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  j_emoticon = library["get_emoticon"][emoticon]
  if j_emoticon == nil
    return "Sorry, that emoticon was not found"
  end
  
  j_emoticon
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  meaning = library["get_meaning"][emoticon]
  if meaning == nil
    return "Sorry, that emoticon was not found"
  end
  
  meaning
end