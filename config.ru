require './config/environment'

require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/platforms_controller'
require_relative 'app/controllers/games_controller'

use Rack::MethodOverride
use GamesController
use UsersController
use PlatformsController
run ApplicationController