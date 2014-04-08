class EventImport 
	
	extend ActiveModel::Naming
	include ActiveModel::Conversion
	include ActiveModel::Validations
	
	
	def initialize(attributes = {})
    	attributes.each { |name, value| send("#{name}=", value) }
  	end
	
	def persisted?
      	false
    end


    def save
		if imported_products.map(&:valid?).all?
			imported_products.each(&:save!)
		  	true
		else
		  	imported_products.each_with_index do |product, index|
		    	product.errors.full_messages.each do |message|
		      		errors.add :base, "Row #{index+2}: #{message}"
		    	end
		  	end
		  	false
		end
	end


    def imported_events
    	@imported_products ||= load_imported_products
  	end

	def load_imported_events
		csv = open_csv
		header = csv.row(1)
		(2..csv.last_row).map do |i|
			row = Hash[[header, csv.row(i)].transpose]
			product = Product.find_by_id(row["id"]) || Product.new
			product.attributes = row.to_hash.slice(*Product.accessible_attributes)
			product
		end
	end

	def open_csv
		Csv.new(file.path, nil, :ignore)
	end


	
end
