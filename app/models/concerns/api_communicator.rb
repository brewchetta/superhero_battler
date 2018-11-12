module ApiCommunicator

  BASE_URL = "https://comicvine.gamespot.com/api"
  API_KEY = "shhhh"

  def character_search(name)
    new_hero_hash = {}
    query = "#{BASE_URL}/characters/?api_key=#{API_KEY}&format=json&limit=5&filter=name:#{name}&field_list=name,deck,api_detail_url,id,image"
    response_thing = RestClient.get(query)
    parsed_response = JSON.parse(response_thing)
    results_array = parsed_response["results"]

    byebug
    results_array.each do |result|
      new_hero_hash[:api_id] = result["id"]
    end

  end


end

#TODO search hits search results, which are displayed
#button exists for each result, which makes another get based on params[api_detail_url] - which appends our api key and params like (name, image, deck)
#that button adds the hero to our db.

#this new page should include a find or create with preseeded data.

#powers query - all powers
#https://comicvine.gamespot.com/api/powers/?api_key=aeedf98edd4d5d6c5bbdd34f7713483c55611cfb

#single character query
#https://comicvine.gamespot.com/api/character/4005-1525/?api_key=aeedf98edd4d5d6c5bbdd34f7713483c55611cfb&format=json&field_list=name,powers

#character search query - currently for darkwing duck
#https://comicvine.gamespot.com/api/characters/?api_key=aeedf98edd4d5d6c5bbdd34f7713483c55611cfb&format=json&limit=5&filter=name:darkwing%20duck&field_list=aliases,deck,api_detail_url,id
