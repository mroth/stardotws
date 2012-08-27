require 'rack/coffee_compiler'

$stdout.sync = true

configure :production do
  require 'newrelic_rpm'  
end

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

# use Rack::Coffee, {
#     :root => 'public',
#     :urls => '/javascripts'
# }

use Rack::CoffeeCompiler, {
  :source_dir => 'public/coffeescripts',
  :url => '/javascripts',
  :alert_on_error => true  # Generates a window.alert on compile error.  Defaults to (RACK_ENV! = 'production')
}
