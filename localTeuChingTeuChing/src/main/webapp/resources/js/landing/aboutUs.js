var index = 0;

document.querySelectorAll('.slide_btn').forEach(function(el) {
	el.addEventListener('click', function() {
		move_text('true');
		
		index = el.id.substring(el.id.length - 1);
		move_slide(--index).then(function(rgx) {
			if(rgx == 'true') {
				window.setTimeout(function() {
					move_text('false');
				}, 1500);
			}
		});
	})
})

function move_slide(idx) {
	return new Promise(function(resolve, reject) {
		document.querySelectorAll('.slide_common').forEach(function(el) {
			el.style.transform = 'translateY(-' + (idx * 100) + 'vh)';
			el.style.transitionDuration = '1.5s';
		});
		
		resolve('true');
	});
}

function move_text(rgx) {
	var title = document.querySelectorAll('.about_title');
	var content = document.querySelectorAll('.about_content');
	
	if(rgx == 'true') {
		title.forEach(function(el) {
			el.style.opacity = '0';
			el.style.transform = 'translateY(100vh)';
		})
		
		content.forEach(function(el) {
			el.style.opacity = '0';
			el.style.transform = 'translateY(100vh)';
		})
	} else {
		title.forEach(function(el) {
			el.style.opacity = '1';
			el.style.transform = 'translateY(44vh)';
			el.style.transitionDuration = '1s';
		})
		
		content.forEach(function(el) {
			el.style.opacity = '1';
			el.style.transform = 'translateY(46vh)';
			el.style.transitionDuration = '1s';
		})
	}
}


// Modal
var modal_wrap = document.querySelector('.aboutUsModalWrap');
var modal = document.querySelector('.aboutUsModal');
var modal_remove_btn = document.querySelector('.aboutUsModalRemove');
var video = document.querySelector('.aboutUsVideo');

function modalOnOff(rgx) {
	if(rgx == 'true') {
		modal_wrap.style.display = 'block';
		modal_remove_btn.style.display = 'block';
		video.style.display = 'block';
		window.setTimeout(function() {
			modal.style.transform = 'translateY(0vh)';
			modal.style.transitionDuration = '1s';
		}, 300);
	} else {
		modal.style.transform = 'translateY(-100vh)';
		modal.style.transitionDuration = '1s';
		window.setTimeout(function() {
			modal_wrap.style.display = 'none';
			modal_remove_btn.style.display = 'none';
			video.style.display = 'none';
			video.pause();
		}, 500);
	}
}