require 'cgi'
cgi = CGI.new
# Receive response in HTML format after receiving data
cgi.out('type' => 'text/html', 'charset' => 'UTF-8') do
  # Take out the "goya" data used as the information mark with the description cgi['goya'] and assign it to a local variable.
  get = cgi['goya']
  # Return the response with HTML
  "<html>
     <body>
       <p>The size of bitter gourd and the information of the sold people are as follows</p>
       String: #{get}
     </body>
   </html>"
end
