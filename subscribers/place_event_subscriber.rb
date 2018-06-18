class PlaceEventSubscriber < EventSubscriberBase
  def create
    puts "=> Create Place: #{event.to_json}"
  end
  
  def update
    puts "=> Update Place: #{event.inspect}"
    puts
  end
end