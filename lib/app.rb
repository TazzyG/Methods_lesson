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
def puts_line(line)
	$report_file.puts line
end
def border
	puts_line "*" * 50
end
def date
puts_line "The Current date is: #{Time.now.strftime("%B %d, %Y")}"
end
def space
	puts_line ""
end
def print_heading(option)
	def ascii_sales_report
		puts_line " ____                      ____                       _   "   
		puts_line "/ ___|  __ _| | ___  ___  |  _ \\ ___ _ __   ___  _ __| |_ "
		puts_line " \\___ \\/ _` | |/ _ \\/ __| | |_) / _  \\'_  \\ / _\\| '__| __|"
		puts_line " ___) | (_| | |  __/\\__ \\ |  _ <  __/ |_) | (_) | |  | |_"
		puts_line "|____/ \\__,_|_|\\___||___/ |_|\\_ \\___| .__/ \\___/|_|   \\__|"
		puts_line "                                    |_|                   "	
		space
		puts_line border
		date
	end
	def ascii_products
		puts_line "                     _            _       "
		puts_line "                    | |          | |      "
		puts_line " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
		puts_line "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
		puts_line "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
		puts_line "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
		puts_line "| |                                       "
		puts_line "|_|                                       "
		space
	end
	def ascii_brands
		puts_line " _                         _     "
		puts_line "| |                       | |    "
		puts_line "| |__  _ __ __ _ _ __   __| |___ "
		puts_line "| '_ \\| '__/ _` | '_ \\ / _` / __|"
		puts_line "| |_) | | | (_| | | | | (_| \\__ \\"
		puts_line "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
		space
	end
	if option == 1
		ascii_sales_report
	elsif option == 2 
		ascii_products
	elsif option == 3
		ascii_brands
	else
		puts_line "Current options are: 1 for sales report, 2 for products, and 3 for brands"
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
		end
		def product_data
				
			# For each product in the data set:
			$products_hash["items"].each do |toy|	
			sales = 0
				#toy["purchases"]["price".to_i]["price"]
				toy["purchases"].each do |purchase|
				  sales += purchase["price"]
		  	end
			retail_price = toy["full-price"].to_f
		  purchases = toy["purchases"].length 	
			average_price = sales/purchases
			discount = retail_price.to_f - average_price.to_f 
			discount_percentage = (discount/retail_price) * 100
			# Data for the Sales Report 
			def write_to_file(message, data)
				# method for writing to file
				puts_line "'" + message + '#' + data + "'"
			end
			# Print the name of the brand	
				space					
				write_to_file("", toy["title"])	
				border 
			# Print the retail price of the toy
				write_to_file("Retail Price: $", retail_price)
			# Calculate and print the total number of purchases
				write_to_file("Total Purchases: ", purchases)
			# Calculate and print the total amount of sales		
			  write_to_file("Total Sales: $", sales)			
			# Calculate and print the average price the toy sold for
				#write_to_file and print the average discount (% or $) based off the average sales price
				write_to_file("Average Discount: $", discount)
			#	write_to_file (Average Discount Percentage: , + discount_percentage.round(2).to_s + "%" 
			
		end
		product_data
		space
		# Print "Brands" in ascii art			
			print_heading(3)			
		def brand_data
			# For each brand in the data set:
			$toy_brands = $products_hash["items"].map { |item| item["brand"] }.uniq
		  $toy_brands.each do |brand|
		  brands_toys = $products_hash["items"].select{ |item| item["brand"] == brand }  
		  # Print the name of the brand
		  puts_line "#{brand}"
		  border
		  # Data and Calculations
		  total_stock_brand = 0
		  total_full_price_brand = 0
		  total_brand_products = 0
		  total_sales = 0
		  brands_toys.each {|toy| total_stock_brand += toy["stock"].to_i }
			# Count and print the number of the brand's toys we stock
			brands_toys.each {|toy| total_brand_products += toy["purchases"].length}
			puts_line "Number of Toys in Stock: #{total_stock_brand}"
      average_price = (total_full_price_brand.round(2)/total_brand_products).round(2)
			# Calculate and print the average price of the brand's toys
			brands_toys.each do |item| 
    		item["purchases"].each do |purchase|
      	total_full_price_brand += item["full-price"].to_f 
    		end
    	end
			puts_line "Average Price $#{(total_full_price_brand.round(2)/total_brand_products).round(2)}"
			# Calculate and print the total sales volume of all the brand's toys combined
			brands_toys.each do |item|
    		item["purchases"].each do |el|   
     			total_sales += el["price"]
		    end
		  end
		  puts_line "Total Sales: $#{total_sales.round(2)}"   
		  space
		### Call Methods Here
			end
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
	file_close

