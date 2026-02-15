orca = require "orca"
import Behaviour from require "orca.core"

Behaviour.getFrame = () => @getRoot!
Behaviour.navigate = (url) => @getFrame!\navigate url

return {
	Application: require "routing.Application"
	Page: require "routing.Page"

	navigate: (url, store) ->	orca.router\navigate url, store if orca.router
	push: (url) => orca.router\navigate url, true if orca.router
	go_back: -> orca.router\go_back!
	has_history: -> #orca.router.history > 1
	get_location: -> orca.router.history[1]
}