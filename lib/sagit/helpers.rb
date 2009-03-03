Dir["#{File.dirname(__FILE__)}/helpers/*.rb"].each &method(:require)

module Sagit
  module Helpers
    include Rendering
    include PrettyOutput

#include Rack::Utils
#    alias :h :escape_html
  end
end
