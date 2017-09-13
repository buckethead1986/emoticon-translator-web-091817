require 'yaml'
require 'pry'
# thing = YAML.load_file('./lib/emoticons.yml')

def load_library(file_path)
yaml_file = YAML.load_file(file_path)
  output = {}
  output["get_meaning"] = {}
  output["get_emoticon"] = {}
    yaml_file.each {|meaning, emoticon|
      output["get_meaning"][emoticon[1]] = meaning
      output["get_emoticon"][emoticon[0]] = emoticon[1]
    }
output
end

def get_japanese_emoticon(file_path, emoticon)
  yaml_file = load_library(file_path)
  yaml_file["get_emoticon"][emoticon] ||= "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  yaml_file = load_library(file_path)
  yaml_file["get_meaning"][emoticon] ||= "Sorry, that emoticon was not found"
end
