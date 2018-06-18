class EventBase
  include EventSubscriberBase::HandleSubscribers

  attr_reader :type, :action, :data

  def initialize(type, action, data)
    @type = type
    @action = action
    @data = data
    puts "= New Event: #{self.inspect}"
  end

  def call
    @subscribers.each {|sub| sub.call(self)}
  end

  def to_json
    {type: type, action: action, data: data}
  end

  def self.builder(datum)
    if datum.is_a? Hash
      klass = "#{datum[:type].to_s.classify}Event".constantize
      klass.new(datum[:action], datum[:data])
    end
  end
end
