$:.unshift File.dirname(__FILE__)
Dir.glob(File.join(File.dirname(__FILE__), 'curies/*.rb')).each { |f| require f }

module Curies
  
end