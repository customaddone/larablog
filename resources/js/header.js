// import { sum } from './sample.js'; // sumモジュールをインポート

var header = new Vue({
	data: {
		scrollY: 0,
	},
	mounted: function() {
		window.addEventListener('scroll', this.handleScroll);
	},
	methods: {
		handleScroll() {
			const title = document.querySelector(`.header-main`);
			const rect = title.getBoundingClientRect().top;
			this.scrollY = rect;
		},
	},
});
header.$mount('header'); // headerオブジェクトを利用しないとエラーが出る
