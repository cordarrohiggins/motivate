//get rid of bullet if enemy dies before firing bullet
if instance_exists(bulletInst) && bulletInst.state == 0 {
	bulletInst.destroy = true;	
}