class EventCollectionPublisher
  include Enumerable

  def self.call(collection=[])
    new(collection).call
    self
  end

  def initialize(collection=[])
    @collection = collection
  end

  def <<(item)
    @collection << item
  end

  def call
    # Publish each event
    each {|event| EventPublisher.publish(event_build(event)); }
    # Then clear collection
    @collection.clear
  end

  def each(&block)
    @collection.each(&block)
  end

  private

  def event_build(event)
    if event.is_a? Hash
      EventBase.builder(event)
    else
      event
    end
  end
end

class EventCollectionPublisherLog < EventCollectionPublisher
  def call
    # Publish each event
    each {|event| puts; EventPublisherLog.publish(event_build(event)); }
    # Then clear collection
    @collection.clear
  end

end
