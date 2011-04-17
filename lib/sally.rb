require 'nokogiri'
require "open-uri"

class Sally
  attr_accessor :target, :resource
  TARGET = /My target '(.*)'/
  RESOURCE = /I want the (.*) of '(.*)'/

  TAGS = {:links => "a"}

  def initialize(file)
    File.open(file).each_line do |line|
      find_target(line)
      find_resouce(line)
    end
  end

  private

  def find_target(string)
    @target = TARGET.match(string).captures[0] unless TARGET.match(string).nil?
  end

  def find_resouce(string)
    resource = RESOURCE.match(string)
    unless resource.nil?
      want = resource.captures[0]
      of = resource.captures[1]
      @resource = "#{of} #{html_tag_for(want)}"
    end
  end

  def html_tag_for(key)
    TAGS[key.to_sym]
  end
end
