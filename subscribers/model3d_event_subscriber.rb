class Model3dEventSubscriber < EventSubscriberBase
  def create
    puts "=> Create Model3d: #{event.inspect}"
    puts
  end
  
  def update
    puts "=> Update Model3d: #{event.to_json}"
  end
end