module top;

	class callback_base;
		virtual task pre_send;
		endtask;
	
	endclass
	class callback_extnd extends callback_base;
		task pre_send();
			$display("I called berfore driving");
	
		endtask

	endclass

	class driving;
		callback_base cb_h=new;
		task send;
			cb_h.pre_send();
			$display("completed driving");
		endtask
	endclass

driving drv;
callback_extnd extnd_h;
		initial 

			begin
				drv=new;
				//drv.send;
				extnd_h=new;//
				drv.cb_h=extnd_h;///here child is pointing parent handle
				drv.send;	
			end
