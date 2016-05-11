require 'json'
# methods go here
# Setup Files
def setup_files
	path = File.join(File.dirname(__FILE__), '../data/products.json')
	file = File.read(path)
	$products_hash = JSON.parse(file)
	$data = $products_hash["items"]
	$report_file = File.new("report.txt", "w+")
end
def file_close
	$report_file.close 
end
def start
	# setup_files # call set up files
  setup_files # load, read, parse, and create the files
  create_report # create the report!
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
		# Print "Sales Report" in ascii art
		print_heading(1)
		# Print today's date
		date
		# Print "Products" in ascii art
		print_heading(2)
		analyse_product_data($data, purchases:"purchases", title:"title",retail_price:"full-price", price: "price")		
		print_heading(3)
		analyse_brand_data
		
end
def analyse_product_data(array, option = {})
	array.each do |toy|
		$toy_title = toy[option[:title]]
		$number_of_products = toy[option[:purchases]].length
		$retail_price= toy[option[:retail_price]]
		$total_sales = 0
		toy[option[:purchases]].each do |sales|
			$total_sales += sales[option[:price]]
		end
		product_details
	end
end
def product_details
		border
		toy_title
		toy_retail_price
	  total_purchases
	  toy_total_sales
	  calculate_average_sales($total_sales, $number_of_products)
		calculate_average_discount($total_sales,$retail_price, $number_of_products)
		space
end
def toy_title
 puts_line $toy_title
end

def toy_retail_price
	puts_line "Retail Price: $#{$retail_price}"
end

def total_purchases
	 puts_line "Total Purchases: #{$number_of_products}"
end

def toy_total_sales
		puts_line  "Total sales: $#{$total_sales}"
end

def calculate_average_sales(total_sales, number_of_products)
	  $average_sales = total_sales/number_of_products
		average_sales
end

def average_sales
	puts_line "Average Sale: $ #{$average_sales}"
end

def calculate_average_discount(total_sales, retail_price, number_of_products)
	$average_discount = (1 - total_sales/(retail_price.to_f * number_of_products)).round(3)*100
	average_discount
end

def average_discount
	puts_line "Average discount: #{$average_discount}%"
end

#Array containing unique brands

def unique_brands
	$data.map{|name| name["brand"]}.uniq 
end

# Filter brands
def analyse_brand_data
	unique_brands.each do |brand|
		#Creates new array by brand
		toys_by_brand = $data.select {|item| item["brand"]==brand}
		#Reset variables as we iterate through hash
		$sale_price = 0
		$retail_price_brands = 0
		#Iterates through new arrays by brand
		toys_by_brand.each do |el|
			$brand_title = el["brand"]
			$retail_price_brands += el["full-price"].to_f
			$brand_stock = toys_by_brand.map {el["title"]}.length
			el["purchases"].each do |toy|
				$sale_price += toy["price"]
			end
		end
		brand_details
	end
end
def brand_details
		
		brand_title
		brand_stock
		calculate_average__brand_price($retail_price_brands, $brand_stock)
		calculate_brand_revenue
		space	
end
def brand_title
	puts_line $brand_title
end
def brand_stock
	puts_line "Number of #{$brand_title} products: #{$brand_stock}"
end
def calculate_average__brand_price(retail_price, brand_stock)
	puts_line "Average price of #{$brand_title} toys $#{(retail_price/brand_stock).round(2)}"
end

def calculate_brand_revenue
	puts_line "Total #{$brand_title} revenue: $#{($sale_price).round(2)}"
end
	start # call start method to trigger report generation
	file_close

