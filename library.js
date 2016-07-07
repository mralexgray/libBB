
/*  This is the single entry point for all widgets/plugins I author.
    They are all written in coffeescript,
    but this is the semanticlly named, js entry-point */

require('coffee-script/register')

module.exports = require('./widget.coffee')
