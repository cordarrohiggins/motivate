//screen pause
if screen_pause() {exit;};

//fade out
alpha -= alphaSpeed;
if alpha <= 0 {
	instance_destroy();
}