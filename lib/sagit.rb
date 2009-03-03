$:.unshift File.expand_path(File.dirname(__FILE__))

# Common libs
%w[rubygems json yaml logger sequel sinatra/base rack pathname].each do |lib|
  require lib
end

%w[string].each do |ext|
  require "sagit/core_ext/#{ext}"
end

module Sagit
  def self.new(config_file = nil)
    self.config = YAML.load_file(config_file) unless config_file.nil?
    # Init database
    Sequel.connect(config[:database_uri])
    # Sagit
    %w[helpers shiphome app].each do |partial|
      require "sagit/#{partial}"
    end
    Sagit::Shiphome.create_table unless Sagit::Shiphome.table_exists?
  end

  def self.root
    Pathname.new(File.dirname(__FILE__)).join("..").expend_path
  end

  def self.default_configuration
    @defaults ||= {
                    :database_uri => "sqlite3::memeory:",
                    :base_uri     => "http://localhost:4567",
                    :use_basic_auth => false
                  }.dup
  end
  
  def self.config
    @config ||= default_configuration
  end

  def self.config=(options)
    @config = default_configuration.merge(options)
  end

  def self.log(message, &block)

  end
end
