require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require_relative './models/photo.rb'
require_relative './controllers/animal_controller.rb'

use Rack::MethodOverride

run AnimalController
