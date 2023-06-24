module tri_state (in,control,out);

input in,control;
output out;



//bufif1
//out = in if control is high , else out = z;

bufif1(out,in,control);



//bufif0
//out = in if control is low, else out = z;

bufif0(out,in,control);



//notif1
//out is complement of in if control is high , else out = z;

notif1(out,in,control);



//notif0
//out is complement of in if control is low, else out = z;

notif0(out,in,control);


endmodule