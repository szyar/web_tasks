require 'webrick'
server = WEBrick::HTTPServer.new({
  DocumentRoot: '.',
  CGIInterpreter: WEBrick::HTTPServlet::CGIHandler::Ruby,
  Port: '3000'
})
%w[INT TERM].each do |signal|
  Signal.trap(signal) { server.shutdown }
end
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')
server.mount('/index.cgi', WEBrick::HTTPServlet::CGIHandler, 'index.rb')
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.start
