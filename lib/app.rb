require 'json'
# methods go here
# Setup Files
def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$report_file = File.new("report.txt", "w+")
end
def file_close
	$report_file.close 
end
def wline(line)
	$report_file.puts line
end
def border
	wline "*" * 50
end
def print_heading(option)
	def ascii_sales_report
		wline " ____                      ____                       _   "   
		wline "/ ___|  __ _| | ___  ___  |  _ \\ ___ _ __   ___  _ __| |_ "
		wline " \\___ \\/ _` | |/ _ \\/ __| | |_) / _  \\'_  \\ / _\\| '__| __|"
		wline " ___) | (_| | |  __/\\__ \\ |  _ <  __/ |_) | (_) | |  | |_"
		wline "|____/ \\__,_|_|\\___||___/ |_|\\_ \\___| .__/ \\___/|_|   \\__|"
		wline "                                    |_|                   "	
		wline ""
		wline border
		wline "The Current date is: #{Time.now.strftime("%B %d, %Y")}"
	end
	def ascii_products
		wline "                     _            _       "
		wline "                    | |          | |      "
		wline " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
		wline "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
		wline "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
		wline "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
		wline "| |                                       "
		wline "|_|                                       "
		wline ""
	end
	def ascii_brands
		wline " _                         _     "
		wline "| |                       | |    "
		wline "| |__  _ __ __ _ _ __   __| |___ "
		wline "| '_ \\| '__/ _` | '_ \\ / _` / __|"
		wline "| |_) | | | (_| | | | | (_| \\__ \\"
		wline "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
		wline ""
	end
	if option == 1
		ascii_sales_report
	elsif option == 2 
		ascii_products
	elsif option == 3
		ascii_brands
	else
		wline "Current options are: 1 for sales report, 2 for products, and 3 for brands"
	end
end
def create_report
	# methods for calculations	
	def print_data
		# Print "Sales Report" in ascii art
		# Print today's date
		print_heading(1)
		def product_data
			# Print "Products" in ascii art
			print_heading(2)
			# For each product in the data set:
			$products_hash["items"].each do |toy|				
			# Print the name of the brand	
						
				wline toy["title"]	
				border# Print the name of the brand	
		# Calculate and print the total number of purchases
				wline "Retail Price: $#{toy["full-price"]}"
		# Calculate and print the total amount of sales
				wline "Total Purchases: #{toy["purchases"].length}"
			
				
			# Calculate and print the average price the toy sold for
		
			# Calculate and print the average discount (% or $) based off the average sales price
			end
		end
		product_data
		def brand_data
			# Print "Brands" in ascii art			
			print_heading(3)
			# For each brand in the data set:
			
				# Count and print the number of the brand's toys we stock
				# Calculate and print the average price of the brand's toys
				# Calculate and print the total sales volume of all the brand's toys combined
			### Call Methods Here
			
	  end
		brand_data
	end
	print_data
	# start report generation
end
def start
	# setup_files # call set up files
  setup_files # load, read, parse, and create the files
  create_report # create the report!
end
	start # call start method to trigger report generation
	

