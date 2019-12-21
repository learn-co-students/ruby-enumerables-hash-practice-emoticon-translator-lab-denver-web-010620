# require modules here

def load_library
  new_hash = {
   "get_meaning" => {},
   "get_emoticon" => {}
 }
 library.each do |meaning, translation|
   english = translation[0]
   japanese = translation[1]
   new_hash["get_meaning"][japanese] = meaning
   new_hash["get_emoticon"][english] = japanese
 end
  return new_hash
end

def get_japanese_emoticon
  library = load_library(file_path)
  library["get_emoticon"].each do |key, value|
    if key == emoticon
      puts value
    end
  end
end

def get_english_meaning
  library = load_library(file_path)
  if library["get_meaning"].include?(japanese_emoticon) 
    library["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

test_emoticons = {"angel"=>["O:)", "japanese_angel"], "angry"=>[">:(", "japanese_angry"], "bored"=>[":O", "japanese_bored"], "confused"=>["%)", "japanese_confused"]}

load_library(test_emoticons)