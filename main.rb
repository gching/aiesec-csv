## main.rb
## Gavin Ching - February 3rd, 2014
## Description: This overall program helps with parsing a given CSV file and creates a CSV file that can be properly integrated with the current
## sales tracker on Podio. (CR - AIESEC Toronto Personal)

Dir["lib/*.rb"].each {|file| require_relative file }	## Require mandatory library files from folder lib.
require 'pry' ## For Debugging.
require 'CSV'




## Ask for either use of console or read froma  file.

choose = 0
console = nil
while choose !="1" && choose != "2" do
	puts "Put 1 to read from Console and 2 from File"
	choose = gets.chomp
	if choose == "1"
		console = true
	elsif choose  == "2"
		console = false
	end
end


writefile_name = "PodioSales-#{Time.now}.txt"



#################### Reading from console ############################
while(console)
	## Request for command.
	puts "Company / Organization Name"
	name = gets.chomp
end





#################### Reading from File ###########################
puts "Insert file name:"
## Get the file name of the file being read.
filename = gets.chomp

begin
	## Open and start writing to a new CSV file

	CSV.open(writefile_name, "wb") do |new_csv|
		## Ask for and insert initial attributes for the columns
		initial_attr = []
		exit_attr = 0
		while exit_attr != "exit"
			puts "Input attributes of this new CSV file, type exit to leave. Common sytanx is organization and city."
			exit_attr = gets.chomp
			exit_attr.downcase!
			initial_attr << exit_attr unless exit_attr == "exit"
		end
		if initial_attr == ["exit"]
			puts "No column attributes, closing program.. :<"
			abort
		end

		## Put in row of attributes in first row
		new_csv << initial_attr

	
		## Parse the given CSV file
		## This function returns the row, and from here we do all the calculations on it.
		parseCSV(filename) do |row, lineNumber|
			## puts "#{lineNumber}" +" --- " + row[0] rescue nil
			## The given file has the company name in index 0 and index 2 is the city.
			new_row = []
			## Go through attributes and ask for values from user
			confirm = false
			while confirm == false do
				initial_attr.each do |attri|
					puts "What is the value of this attribute - #{attri}?"
					if attri == "organization" || attri == "city" ## From file!
						puts "Value is already in the CSV file being read!"
						if attri == "organization"
							new_row << row[0] unless row[0] == nil
						else
							new_row << row[2] unless row[2] == nil
						end

					else ## From user
						new_row << gets.chomp
					end
				end

				## Confirm with user
				print new_row
				puts ""
				puts "Confirm this! Y/n"
				confirm_in = false
				while confirm_in != "Y" && confirm_in != "n" do
					confirm_in = gets.chomp
				end
				if confirm_in == "Y"
					confirm = true
				else
					confirm = false
				end
			end
			## Insert new_row into the csv file
			new_csv << new_row
			puts "Want to exit? Y/n"
			confirmy = false
			while confirmy != "Y" && confirmy != "n" do
					confirmy = gets.chomp
				end
				if confirm_in == "Y"
					puts "Bye!"
					abort
			end

		end
	end
## Close the file.

#rescue		## If the file cannot be read then close the write file and delete it.
 #puts "Error!"
end


