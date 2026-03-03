orca = require "orca"

assert orca.Behaviour, "Routing system requires orca.Behaviour to be defined. Please ensure you have the latest version of Orca."
assert not orca.Behaviour.getFrame and not orca.Behaviour.navigate, "Another routing system is already defined. Please ensure you don't have multiple routing systems included."

orca.Behaviour.getFrame = () => @getRoot!
orca.Behaviour.navigate = (url) => @getFrame!\navigate url

return {
	Application: require "routing.Application"
	Page: require "routing.Page"

	navigate: (url, store) ->	orca.router\navigate url, store if orca.router
	push: (url) => orca.router\navigate url, true if orca.router
	go_back: -> orca.router\go_back!
	has_history: -> #orca.router.history > 1
	get_location: -> orca.router.history[1]
}