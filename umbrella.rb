require "http"
require "json"
require "dotenv/load"

pp "Where are you located"

# user_location = gets.chomp.gsub(" ", "%20")
user_location = "Chicago"

pp user_location

gmaps_key = ENV.fetch("GMAPS_KEY")
maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"
require "http"

resp = HTTP.get(maps_url)

raw_response = resp.to_s

require "json"

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)

geo = first_result.fetch("geometry")

location = geo.fetch("location")
pp latitude = location.fetch("lat")
pp longitude = location.fetch("lng")
