Template.instance_list.helpers
		
	instances: ->
		return db.instances.find({}, {sort: {modified: -1}});

	boxName: ->
		return Session.get("box");


Template.instance_list.events

	'hidden.bs.modal #createInsModal': (event)->
		FlowRouter.go("/workflow/instance/" + Session.get("instanceId"));