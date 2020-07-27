# Use pg library
require 'pg'
# PG::connect(dbname: "goya") connects ruby to goyaDB
# Store the information that you are connected in a variable named connection
connection = PG.connect(dbname: 'goya')
connection.internal_encoding = 'UTF-8'
begin
  # Operate PostgreSQL using connection variable
  # .exec, goyaDB "select weight, give_for from crops;"
  # Directly execute the SQL statement of # and store the result in the result variable
  result = connection.exec('select weight, give_for from crops;')
  # Process each fetched line
  result.each do |record|
    # Fetch each line and output it on the terminal with puts
    puts "Goya size: #{record['weight']} Sold by: #{record['give_for']}"
  end
ensure
  # Finally, close the database connection with .finish
  connection.finish
end
