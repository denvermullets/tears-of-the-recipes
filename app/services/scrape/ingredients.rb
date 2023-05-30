require 'net/http'

module Scrape
  class Ingredients < Service
    def initialize
      @url = 'https://samurai-gamers.com/zelda-tears-of-the-kingdom/materials-list-6/'
    end

    def call
      doc = load_html(@url)
      parse_ingredients(doc)

      puts 'Scrape complete'
    end

    def load_html(url)
      url = URI.parse(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == 'https')
      request = Net::HTTP::Get.new(url.request_uri)
      response = http.request(request)
      html = response.body
      Nokogiri::HTML(html)
    end

    def parse_ingredients(doc)
      table_rows = doc.css('table tr')[1..]

      table_rows.each do |row|
        id = row.css('td[style="background-color: #c0c0c0; color: #ffffff; text-align: center;"] strong')
                .first&.text.to_i
        name = row.css('td:nth-child(2) strong').text
        description = row.css('td:nth-child(5)').text
        properties = row.css('td:nth-child(3) li').map(&:text)
        location_list = row.css('td:nth-child(4)').text.split(', ').map(&:strip)
        next if id.nil? || name.nil? || name.empty? || description.nil? || description.empty?

        material = Material.find_or_create_material({ compendium_id: id, name:, description: })
        locations = location_list.map { |loc| Location.find_or_create_location({ name: loc }) }
        effects = properties.map { |effect| Effect.find_or_create_effect({ property: effect }) }

        locations.map do |location|
          MaterialLocation.find_or_create_material_location({ location_id: location.id, material_id: material.id })
        end

        effects.map do |effect|
          MaterialEffect.find_or_create_material_effect({ effect_id: effect.id, material_id: material.id })
        end

        puts "ID: #{id}"
        puts "Material: #{name}"
        puts "Properties: #{properties.join(', ')}"
        puts "Locations: #{location_list}"
        puts "Description: #{description}"
        puts '---'
      end
    end
  end
end
