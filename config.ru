require 'rack/coffee'

$stdout.sync = true

use Rack::Static, {
  :urls => ["/stylesheets", "/images"],
  :root => "public"
}

run lambda { |env|
  [
    200, 
    {
      'Content-Type'  => 'text/html', 
      'Cache-Control' => 'public, max-age=86400' 
    },
    File.open('public/index.html', File::RDONLY)
  ]
}

use Rack::Coffee, {
    :root => 'public',
    :urls => '/javascripts'
}
