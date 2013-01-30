require 'rack'
require 'rack/contrib/try_static'

use Rack::TryStatic,
  :root => "public",
  :urls => ["/"],
  :try  => ['.html', 'index.html', '/index.html']

run lambda { |env|
  [
    404,
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/404.html', File::RDONLY)
  ]
}
