require 'cgi'
require 'pg'

cgi = CGI.new

connection = PG.connect(dbname: 'goya')
connection.internal_encoding = 'UTF-8'
begin
  result = connection.exec("select weight, give_for from crops;")
  data = []
  result.each do |record|
    data << "Size of bitter gourd: #{record["weight"]} Sold by: #{record["give_for"]}"
  end
ensure
  connection.finish
end

cgi.out('type' => 'text/html', 'charset' => 'UTF-8') do
  "<html>
     <body>
       <p>Goya in pretty format</p>
        <pre>#{data.join("\n") }</pre>
     </body>
   </html>"
end
