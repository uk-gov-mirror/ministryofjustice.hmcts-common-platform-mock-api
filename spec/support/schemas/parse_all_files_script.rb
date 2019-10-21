# frozen_string_literal: true

require 'json'

# use like '$ ruby parse_all_files_script.rb <dir with json schemas> <output_file_name>

def model_name(file_name)
  "rails g model #{file_name[0].upcase}#{file_name.split('.').first[1..]} "
end

def file_name_string(file_path)
  file_path.split('/').last
end

def extract_data(json_file)
  JSON.parse(File.read(json_file))
end

out_file = File.new("#{ARGV[1]}.txt", 'w')

puts 'Starting...'
Dir.glob("#{ARGV[0]}/*.json") do |json_file|
  file_name = file_name_string(json_file)
  puts "Creating model string for #{file_name}"
  data = extract_data(json_file)

  out_file.puts file_name
  out_file.puts '-------------------------------------'

  generator_string = model_name(file_name)

  data['properties'].each do |property|
    name = property[0].to_s
    generator_string += if property[1]['type']
                          "#{name}:#{property[1]['type']} "
                        elsif property[1]['$ref'].include?('uuid')
                          "#{name}:uuid "
                        else
                          "#{name}:references "
                        end
  end
  out_file.puts generator_string
  2.times { out_file.puts }
rescue StandardError
  puts "Issue with #{file_name}"
end
puts 'Finished...'
