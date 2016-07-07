[winston,fs,path,util] = (module.parent.parent.require x for x in ['winston','fs','path','util'])

class Plugin
	constructor: ->
		@metadata = JSON.parse fs.readFileSync("#{__dirname}/plugin.json") ? {}
		@logger = new winston.Logger
			transports: [ new winston.transports.Console
				timestamp: -> "#{(date = new Date()).getDate()}/#{date.getMonth() + 1} #{date.toTimeString().substr 0,5} [#{global.process.pid}]"
				level: if global.env is 'production' then 'info' else 'verbose'
				label: "plugin/#{@metadata.name.toLowerCase()}"
				colorize: true]

	init: (params, cb) => # called by NodeBB during `static:app.load` hook
		@app = params.app
		@router = params.router
		cb()

	inspect: (describe, x) => @logger.log 'info', "#{describe ? ''}#{util.inspect x}"
