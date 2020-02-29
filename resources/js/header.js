const sayoh = require('./sample.js')

var header = new Vue({
	el: '#header',

	mounted: function() {
		sayoh();
	},
});
