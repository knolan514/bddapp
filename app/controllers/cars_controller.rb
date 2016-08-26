class CarsController < ApplicationController
  def index
  end

  def create
    @car = Car.new(params[:make],params[:model],params[:year], params[:color])
    cookies[:car] = @car.to_yaml
    render 'status.html.erb'
  end

  def accelerate
    @car = YAML.load(cookies[:car])
    @car.accelerate
    cookies[:car] = @car.to_yaml
    render 'status.html.erb'
  end

  def brake
    @car = YAML.load(cookies[:car])
    @car.brake
    cookies[:car] = @car.to_yaml
    render 'status.html.erb'
  end

  def lights
    @car = YAML.load(cookies[:car])
    @car.lights
    cookies[:car] = @car.to_yaml
    render 'status.html.erb'
  end

  def parking_brake
    @car = YAML.load(cookies[:car])
    if !params[:set_release].nil?
      @car.change_brake = params[:set_release]
      cookies[:car] = @car.to_yaml
    end
    render 'status.html.erb'
  end

end
