module ApiCommunicator

  BASE_URL = "https://comicvine.gamespot.com/api"
  API_KEY = "aeedf98edd4d5d6c5bbdd34f7713483c55611cfb"

  def character_search(name)
    final_array = []
    new_hero_hash = {}
    query = "#{BASE_URL}/characters/?api_key=#{API_KEY}&format=json&limit=5&filter=name:#{name}&field_list=name,deck,api_detail_url,id,image"
    response_thing = RestClient.get(query)
    parsed_response = JSON.parse(response_thing)
    results_array = parsed_response["results"]
    results_array.each do |result|
      new_hero_hash[:api_id] = result["id"]
      # new_hero_hash[:image_url] = result["image"]["screen_url"]
      # new_hero_hash[:description] = result["deck"]
      # new_hero_hash[:api_url] = result["api_detail_url"]
      new_hero_hash[:name] = result["name"]
      final_array << new_hero_hash
      new_hero_hash = {}
    end
    final_array
  end

  def new_from_api(api_id)
    new_hero_hash = {}
    # new_hero_hash[:powers] = []
    query = "#{BASE_URL}/character/4005-#{api_id}/?api_key=#{API_KEY}&format=json&field_list=name,powers,id,image,deck,powers"
    response_thing = RestClient.get(query)
    parsed_response = JSON.parse(response_thing)
    # parsed_response["results"]["powers"].each {|power| flash[:powers] << power["name"]}
    new_hero_hash[:api_id] = parsed_response["results"]["id"]
    new_hero_hash[:image_url] = parsed_response["results"]["image"]["screen_url"]
    new_hero_hash[:description] = parsed_response["results"]["deck"]
    new_hero_hash[:name] = parsed_response["results"]["name"]
    created_hero = Hero.create(new_hero_hash)
    # new_hero_hash[:powers].each {|power| created_hero.powers << power}
    created_hero
  end

end


#this new page should include a find or create with preseeded data.

#powers query - all powers
#https://comicvine.gamespot.com/api/powers/?api_key=aeedf98edd4d5d6c5bbdd34f7713483c55611cfb

#single character query
#https://comicvine.gamespot.com/api/character/4005-1525/?api_key=aeedf98edd4d5d6c5bbdd34f7713483c55611cfb&format=json&field_list=name,powers

#character search query - currently for darkwing duck
#https://comicvine.gamespot.com/api/characters/?api_key=aeedf98edd4d5d6c5bbdd34f7713483c55611cfb&format=json&limit=5&filter=name:darkwing%20duck&field_list=aliases,deck,api_detail_url,id
