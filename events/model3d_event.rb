class Model3dEvent < EventBase
  def initialize(action, data)
    super(:model3d, action, data)
    @subscribers = [Model3dEventSubscriber]
  end
end