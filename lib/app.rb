require 'json'
# methods go here
def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end

# Setup Files
# setup_files # call set up files

def border
	puts "*" * 50
end
def print_heading(option)
	def ascii_sales_report
		puts " ____                      ____                       _   "   
		puts "/ ___|  __ _| | ___  ___  |  _ \\ ___ _ __   ___  _ __| |_ "
		puts " \\___ \\/ _` | |/ _ \\/ __| | |_) / _  \\'_  \\ / _\\| '__| __|"
		puts " ___) | (_| | |  __/\\__ \\ |  _ <  __/ |_) | (_) | |  | |_"
		puts "|____/ \\__,_|_|\\___||___/ |_|\\_ \\___| .__/ \\___/|_|   \\__|"
		puts "                                    |_|                   "	
		puts ""
		puts border
		puts "The Current date is: #{Time.now.strftime("%B %d, %Y")}"

	end
	def ascii_products
		puts "                     _            _       "
		puts "                    | |          | |      "
		puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
		puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
		puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
		puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
		puts "| |                                       "
		puts "|_|                                       "
		puts ""

	end
	def ascii_brands
		puts " _                         _     "
		puts "| |                       | |    "
		puts "| |__  _ __ __ _ _ __   __| |___ "
		puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
		puts "| |_) | | | (_| | | | | (_| \\__ \\"
		puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
		puts ""
	end
	if option == 1
		ascii_sales_report
	elsif option == 2 
		ascii_products
	elsif option == 3
		ascii_brands
	else
		puts "Current options are: 1 for sales report, 2 for products, and 3 for brands"
	end
end
def create_report
	# methods for calculations
	
	def print_data

		# Print "Sales Report" in ascii art
		# Print today's date
		print_heading(1)

		# Print "Products" in ascii art
		print_heading(2)
		# For each product in the data set:
			# Print the name of the toy
			# Print the retail price of the toy
			# Calculate and print the total number of purchases
			# Calculate and print the total amount of sales
			# Calculate and print the average price the toy sold for
			# Calculate and print the average discount (% or $) based off the average sales price

		# Print "Brands" in ascii art
		print_heading(3)
		# For each brand in the data set:
			# Print the name of the brand
			# Count and print the number of the brand's toys we stock
			# Calculate and print the average price of the brand's toys
			# Calculate and print the total sales volume of all the brand's toys combined

		### Call Methods Here
	end
	print_data
end
# start report generation
def start
  setup_files # load, read, parse, and create the files
  create_report # create the report!
end

	start # call start method to trigger report generation
	

