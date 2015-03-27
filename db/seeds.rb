regions = ['North America', 'South America', 'Europe', 'Asia', 'Australia/Oceania', 'Africa', 'Antarctica']
regions.each do |region|
  Region.where(name: region).first_or_create
end