import { sum, multiply } from './sample.js'; // sumモジュールをインポート

var header = new Vue({
	el: '#header',

	mounted: function() {
		alert(sum(1,2,3));
	},
});
