class Car
  def initialize(make, models, year, color)
    @make = make
    @model = models
    @year = year
    @speed = 0
    @lights = "off"
    @parking_brake = 'release'
    @color = color
  end

  def make
    @make
  end

  def model
    @model
  end

  def year
    @year
  end

  def speed
    @speed
  end

  def accelerate
    if @parking_brake == 'release'
      @speed = @speed + 10
    end
  end

  def brake
    if @speed <= 7
      @speed = 0
    else
     @speed = @speed - 7
   end
  end

  def lights_on
    @lights
  end

  def lights
    if @lights == 'off'
      @lights = 'on'
    else
      @lights = 'off'
    end
  end

  def parking_brake
    @parking_brake
  end

  def change_brake=(x)
    if @speed == 0
      @parking_brake = x
    end
  end

  def color
    @color
  end


end
