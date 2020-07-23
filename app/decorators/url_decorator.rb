class UrlDecorator
  attr_reader :url
  def initialize(url)
    @url = url
  end

  def full_url
    "#{ENV['host']}/#{url.key}"
  end

  def clicks
    count = @url.clicks_count.to_i
    "#{count} #{'click'.pluralize(count.to_i)}"
  end

  def method_missing(method_name, *args, &block)
    url.send(method_name, *args, &block)
  end

  def respond_to_missing?(method_name, include_private = false)
    url.respond_to?(method_name, include_private) || super
  end
end
