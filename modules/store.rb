require 'json'

module Store
  def save_persons
    File.open('data/people.json', 'w') do |f|
      f.write @people.map { |person| person_to_hash person }.to_json
    end
  end
end