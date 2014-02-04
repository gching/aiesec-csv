## csv_to_lead.rb
## Gavin Ching - February 3rd, 2014
## Description: Used to convert a given CSV file containing companies names and go step by step to fill in details for Podio integration.


CSV.foreach("YourNextStartup") do |row|
  puts row
end