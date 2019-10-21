require 'json'

# run like ruby parse_script <name_of_json_schema.json>

file = File.read(ARGV[0])

data_hash = JSON.parse(file)

generator_string = "rails g model #{ARGV[0][0].upcase}#{ARGV[0][1..].gsub('.json', '')} "


data_hash['properties'].each do |property|
  name = property[0]
  if property[1]['type']
    generator_string << "#{name}:#{property[1]['type']} "
  elsif property[1]['$ref'].include?('uuid')
    generator_string << "#{name}:uuid "
  else
    generator_string << "#{name}:references "
  end
end

puts generator_string
