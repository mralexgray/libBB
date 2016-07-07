#!/usr/bin/env coffee

name = 'FileMan'

cfg = process.env

json =
	id: cfg.npm_package_name
	description: cfg.npm_package_description
	url: cfg.npm_package_homepage
	name: name
	library: 'library.js'
	hooks: [
		{ "hook": "static:app.load",           "method": "init" }
		{ "hook": "filter:admin.header.build", "method": "addAdminNav" }
	]
		# { hook: 'filter:widgets.getWidgets', method: 'define' }
		# { hook: "filter:widget.render:#{name.toLowerCase()}", method: 'render' }]
	templates: 'templates'
	scripts: []

require('fs').writeFile 'plugin.json', JSON.stringify(json,null,2)
