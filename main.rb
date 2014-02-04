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


#writefile_name = "PodioSales-#{Time.now}.txt"
#writefile = File.new(writefile_name, "w")


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
	## Parse the given CSV file
	## This function returns the row, and from here we do all the calculations on it.
	parseCSV(filename) do |row, lineNumber|
		 puts "#{lineNumber}" +" --- " + row[0] rescue nil
	end
## Close the file.

#rescue		## If the file cannot be read then close the write file and delete it.
 #puts "Error!"
end


