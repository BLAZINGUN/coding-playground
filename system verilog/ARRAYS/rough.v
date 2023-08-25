/*
class statistics;

time startT,stopT;

function statistics copy();

    copy.startT = this.startT;
    copy.stopT = this.stopT;

endfunction

endclass




class packet;

bit [31:0] addr,parity;
bit [31:0] data[20];

statistics stat_data = new();

int PKT_ID;

function new(int addr, int parity);
    this.addr = addr;
    this.parity = parity;
endfunction


function packet copy();
    copy = new();
    copy.addr = this.addr;
    copy.parity = this.parity;
    copy.data = this.data;
    copy.stat_data = this.stat_data.copy;
endfunction


endclass



module top;

packet src,dst;

initial 
    begin
        src = new();
        assert(src.randomize());
        startT = 30;
        stopT = 100;
        dst = src.copy();         
    end

endmodule

222222222222222222222222222222222222222222222222222



x = 36; y = 36; z = 37;
x = 36; y = 36; z = 38;
x = 36; y = 36; z = 39;
x = 37; y = 37; z = 38;
x = 36; y = 36; z = 39;
x = 38; y = 38; z = 39;


3333333333333333333333333333333333333333333333333333


class example;

bit [3:0] a[];

constraint c1 { a.size > 10;
                a.size < 20;
                foreach(a[i])
                    $countones(a[i]) = 2;}

endclass




444444444444444444444444444444444444444444444444444444444444
*/
module top;

class example;

rand bit [5:0] a[10];
constraint c1 {unique{a};}

endclass

example e1;

initial
    begin
        e1 = new();
        assert(e1.randomize());
        e1.a.rsort();
        $display("array is %p",e1.a);
     $display("the second largest element of the array is %d",e1.a[1]);
    end
endmodule

555555555555555555555555555555555555555555555555555555555555555555


888888888888888888888888888888888888888888888888888888888888888888

* callback means a return call

* system verilog callback specifies the rules to define the methods and placing method calls to achieve a callback

* callbacks are empty methods with a call to them

* a method of the class is impelemented with calls to dummy methods

* the user can extend the class and implement the dummy methods

* dummy methods are called callback methods and calls to the dummy methods are called callback hooks

* there wont be any impact for not implementing the callback methods.

* it is used to add additional functionality without disturbing the existing code

Ex:

* randomize is one of the system verilog methods which has the callback features implemented in it.

* randomize method is implemented with the callback features to enable the execution of pre_randomize 
and post_randomize methods before and after the randomize method execution

* this is done by placing the callback hooks to pre_randomize() and post_randomize() methods in it.

* if required the user can implement the pre_randomize and post_randomize methods


999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999

Inheritance 

* Inheritance is an OOP concept that allows user to create classes that are 
    built upon existing classes.

* the new class can have new properties and methods along with having access to all the properties and methods of the original class.

* it allows re-usability


Polymorphism

* Polymorphism means many forms.
* this provides an ability to an object to take on many forms.
* method handle of super-class can be made to refer to the subclass method, this allows different forms of the same method.
* for this to be possible we need three conditions
1. Inheritance
2. method with same name
3. virtual method


Abstract class

* system verilog class declared with the keyword virtual is called as an abstract class
* an abstract class sets out thee prototype for the sub-classes
* an abstract class can contain methods for which there is only a prototype and no implementation , just a method declaration.
* to use it we need to create a sub-class for it.


pure virtual method

* a virtual method inside an abstract class can be declared with the keyword pure and is called a pure virtual method.
* such methods only require a prototype to be specified within the abstract class.
* implementation is left to be defined within the sub-classes.


******************************************************************
10

difference between mailbox and queue

mailbox

* mailbox is a higher level concept that is built-in class around a combination of queues and semaphores
    and is used to communicate between tb components for sharing data.
* we can't access individual indexes of a mailbox
* mailbox can only act as a fifo
* we cannot insert elements in between a mailbox
* mailbox has blocking and non blocking methods
* mailbox is typically used when there are multiple threads running in parallel and wants to share data 

queue

* queue is just a datatype
* queue can act as both fifo and lifo
* we can insert elements in between a fifo
* we can access head,tail,middle elements in a queue.


******************************************************************

// uvm ral adapter 

* the RAL adapter acts as a converter between the RAL model and interface.
* it converts transactions of RAL methods to Interface/bus transactions.
* the adapter converts between register model read, write methods and the interface specific transactions
* the transaction adapter is implemented by extending the uvm_reg_adapter class and implementing the reg2bus() and bus2reg() methods.
* reg2bus method converts the RAL transactions to interface(bus) transactions
* bus2reg method converts the interface(bus) transactions to RAL transactions


******************************************************************

//difference between TLM port and analysis port


TLM port

* TLM put and get ports require one-to-one connection.
* they have blocking methods like put, get and peek
* they have non-blocking methods like try_put, try_get, and try_peek



Analysis port

* uvm_analysis_port is a specialized TLM port 
* it has a single non_blocking function called write().
* supports single analysis port and multiple analysis exports.
* analysis port may be connected to zero, one or many analysis exports.




******************************************************************
when will simulator come out of run phase

* when the simulator enters the run phase an objection is raised using phase.raise_objection(this) or starting_phase.raise_objection(this)
* we can drop the objection using phase.drop_objection(this) or starting_phase.drop_objection(this).
* the simulator stays in the run phase until all objections are dropped.
* when all objections are dropped, phase_ready_to_end is called.
* this is the last chance to raise objection.
* after all objections are dropped, the simulator comes out of the run phase



******************************************************************

which tlm port is used in driver and sequencer

* driver uses seq_item_port
* sequencer used seq_item_export
* driver and sequencer are connected in the connect phase of agent


code 

class write_agent extends uvm_agent;

write_drv write_drv_h;
write_seqr write_seqr_h;

function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

write_drv_h.seq_item_port.connect(write_seqr_h.seq_item_export);

endfunction

endclass



******************************************************************

* we pass the static interface handle from the top to the driver using uvm_config_db
* we set it in the the top module and get it in the build phase of the driver.
* we connect it with the virtual interface handle in the connect phase of the driver


class write_drv;

function void build_phase(uvm_phase phase);

if(!uvm_config_db #(write_config)::get(this,"","write_config",write_cfg))
    `uvm_fatal("write_driver","cannot get config file")

endfunction

function void connect_phase(uvm_phase phase);

vif = write_cfg.aif;

endfunction

endclass

******************************************************************

* we can change the behavior of UVM TB by replacing the existing driver with 
    new driver in specific agents by using set_inst_override_by_type()
******************************************************************


* UVM_DEBUG macro is used for debug messages.
* debug messages can be avoided during regression by changing the verbosity to UVM_FULL
******************************************************************

* run_test() method creates the objects of the testcase and initiates the build process of the TB environment

* to run different testcases, we can include the test class name as an argument in the run_test()
* we can include the test class name using +UVM_TESTNAME = test_class_name

******************************************************************


to get inside a component we use

if(!uvm_config_db #(write_config)::get(this,"","write_config",write_cfg))
    `uvm_fatal("write_driver","cannot get config file")

write_config is the type of the element being configured 
this is the hierarchial starting point of where the database entry is accessible
the second argument is thee hierarchial path that limits the accessibility of the database entry
write_cfg is the variable to get the data stored in the config db


to get inside an object we use

   if (uvm_config_db#(int)::get(this, "config_field_name", my_config_value))
      $display("Retrieved config value: %0d", my_config_value);


      ******************************************************************


UVM phases are a synchronizing mechanism for the components in the environment.
phases are represented by callback methodsa set of predefined phases and corresponding callbacks are provided in uvm_component. 
the method can either be a function or a task

there are 9 phases

1. build 
2. connect
3. end of elaboration
4. start of simulation
5. run
6. extract
7. check
8. report
9. final
 
all phases are functions expect run phase
run phase is a task as it consumes time
run phase executes in parallel way
build and final phase execute in top-down manner
the rest execute in bottom-up manner


******************************************************************


in sequence file , the executable code is written in the body() method


******************************************************************



class example;

rand int da[];

constraint c1 {da.size == 10;}

function void post_randomize();

 for(int i = 0 ; i < count; i++)

                        begin
                                for(int j=i+1;j<count;j++)
                                        begin
                                                if(e1.a[i] > e1.a[j])
                                                        begin
                                                                e1.a[i] = e1.a[i] + e1.a[j];
                                                                e1.a[j] = e1.a[i] - e1.a[j];
                                                                e1.a[i] = e1.a[i] - e1.a[j];

                                                        end
                                                else
                                                        continue;
                                        end

                        end

endfunction

endclass




******************************************************************



class pkt;

bit[7:0] da1;
bit[7:0] da2;
bit[7:0] da3;


constraint c1 {da1.size > 15;}
constraint c2 {da2.size > 15;}
constraint c3 {da3.size > 15;}
constraint c4 {da1.size < 25;}
constraint c5 {da2.size < 25;}
constraint c6 {da3.size < 25;}

constraint c7 {foreach(da1[i])
                    {da1[i] >1;
                        da1[i] <200;}}

constraint c8 {foreach(da1[i])
                {foreach(da2[j])
                    da1[i] != da2[j];
                }
}

endclass
******************************************************************

* when all objections are dropped, phase_ready_to_end is called.
* this is the last chance to raise objection before the simulator goes to the next phase.
* if the objections raised in this method are dropped, then the simulator exits run phase

******************************************************************



* phases are used for synchronization between the components

build_phase is used to construct sub-components right from the test case(top-down).
connect_phase is used to connect components using TLM ports(bottom-up).
end_of_elaboration phase is used to make any final adjustments to the structure,configuration or connectivity of the tb before simulation starts
start_of_simulation_phase is used to display banners, tb topology or configuration information
run_phase is a task and it executes in a parallel way
extract_phase is used to retrieve and process information from scoreboard and coverage
check_phase checks if the dut behaves correctly and identifies errors that may have occurred during the execution
report_phase displays the result of the simulation
final_phase completes any other outstanding actions


******************************************************************

class eth_pkt;

rand byte payload[];


constraint c1 {payload >10;
                payload < 20;
}


constraint c2 {foreach(payload[i])
                   { if (i>0)
                        payload[i] = payload[i-1] +2;
                    
                   }}
endclass



******************************************************************


non-blocking statements should not be used in program blocks


******************************************************************


module parity_gen(data_in,en,parity);

input [7:0] data_in;
input en;
output parity;


function odd_parity_gen();
input en;
input [7:0] data_in;
output parity;

if (en)
    parity = ~^data_in;

endfunction

initial
    begin

        odd_parity_gen(en,data_in,parity);

    end

endmodule


******************************************************************

module top;

sequence s1;
    $rose(enable);
endsequence

sequence s2;
    $rose(b_out) ##1 $fell(b_out);
endsequence


property p1;
    @(posedge clock)
    s1 |-> s2 ##10 s2;
endproperty

a: assert property (p1);
endmodule

******************************************************************

module test();

        class packet;

                rand int addr;
                rand int data;

                function packet copy();
                        copy = new();
                        copy.addr = this.addr;
                        copy.data = this.data;
                endfunction

        endclass

packet src,dst;

initial
        begin
                src = new();
                assert(src.randomize());
                dst = src.copy();
                $display("src %p",src);
                $display("src %p",dst);
        end


endmodule

******************************************************************

uvm_config_db #(virtual write_if)::set(null, "*", "vif_write", write);
uvm_config_db #(virtual read_if)::set(null, "*", "vif_read", read);




******************************************************************


class packet;

rand int addr;
rand int data;

constraint c1 { add>5;
                addr<10;
                data>20;
                data<50;
                data dist {[20:40] := 90, [40-50] := 10};
    }

endclass


class generator;

    packet pkt,pkt2sb;
    mailbox gen2sb;

    function new(mailbox gen2sb);
        this.gen2sb = gen2sb;
    endfunction

    task gen_packet;
        repeat(100)
            begin
                assert(pkt.randomize);
                pkt2sb = new pkt;
                gen2sb.put(pkt2sb);
            end
    endtask

endclass


******************************************************************


module up_down_counter(clock,reset,load,up_down,data,count);

input reset,clock,up_down,load;
input [3:0] data;
output [3:0] count;

always @ (posedge clock or posedge reset)

    begin

            if(reset)
                begin
                    count <= 12;
                end

            else if (up_down)
                begin
                    if(load)
                        count <= data;
                    else
                        begin    
                            if(count >= 11)
                                count <= 0;
                            else
                                count <= count + 1'b1;
                        end
                end

            else if (!up_down)
                begin
                    if(load)
                        count <= data;
                    else
                        begin    
                            if(count == 0)
                                count <= 0;
                            else
                                count <= count - 1'b1;
                        end
                end

            else
                count <= count;
    end

endmodule


******************************************************************


property p1;

@(posedge clk)

$rose(clear) |-> !q;

!a && b |=> q != $past(q,1);

endproperty



property p2;

@(posedge clk)
disable iff(clear)

a&&b |-> !q; 

a&&!b |-> q;

endproperty

a1 : assert property(p1);
a2 : assert property(p2);

******************************************************************


class packet;

rand bit [5:0] payload;
rand bit [1:0] addr;
rand bit [7:0] crc;

int txn_id;


header = {payload,addr};
crc = header ^ (^payload)

constraint c1 { addr != 2;
                payload < 60;
}

endclass

******************************************************************

property p1;

@posedge(clock)
$rose(req) ##1(req[*3]) |-> grant;

endproperty


property p2;

@posedge (clock)
$fell(req) ##1(!req[*3]) |-> grant;

endproperty

******************************************************************


no_of_agents = 2;
agent1.is_active = 1;
agent2.is_active = 0;



******************************************************************


property p1;

$rose(psel) |=> $rose(penable);

$rose(penable)  

endproperty


******************************************************************
max vlaue in an array

module top;

class example;

rand bit[4:0] a[10];
bit[4:0] q[$];
bit[4:0] max_value;

//constraint c1 {}
endclass


example e1;

initial
        begin
                e1 = new();
                assert(e1.randomize);
                $display("array \n%p",e1.a);

                //e1.q = e1.a.max();

                e1.max_value = e1.a[0];
                for (int i = 1; i<$size(e1.a)-1;i++)
                        begin
                           if(e1.a[i] > e1.max_value)
                                e1.max_value = e1.a[i];                              
                        end

                $display("maximum value in the array is : %d ",e1.max_value);

        end

endmodule



******************************************************************

min vlaue in an array

module top;

class example;

rand bit[4:0] a[10];
bit[4:0] q[$];
bit[4:0] min_value;


endclass


example e1;

initial
        begin
                e1 = new();
                assert(e1.randomize);
                $display("array \n%p",e1.a);

                //e1.q = e1.a.max();

                e1.min_value = e1.a[0];
                for (int i = 1; i<$size(e1.a)-1;i++)
                        begin
                           if(e1.a[i] < e1.min_value)
                                e1.min_value = e1.a[i];                              
                        end

                $display("minimum value in the array is : %d ",e1.min_value);

        end

endmodule


******************************************************************

module top;

class example;

rand bit[4:0] a[10];
bit[4:0] q[$];
int qi[$];

endclass


example e1;

initial
        begin
                e1 = new();
                assert(e1.randomize);
                $display("array \n%p",e1.a);

                //e1.qi = e1.a.find_index(item) with (item > 15);

                //e1.qi = e1.a.find_index with (item > 15);    //both these are same



                foreach(e1.a[i])
                        begin
                                if(e1.a[i] > 15)
                                        e1.qi.push_back(i);

                        end


                $display("queue \n%p ",e1.qi);




        end

endmodule

******************************************************************

module top;

class example;

rand bit[4:0] a[10];
int q[$];

//constraint c1 {}
endclass


example e1;

initial
        begin
                e1 = new();
                assert(e1.randomize);
                $display("array \n%p",e1.a);

  //              e1.q = e1.a.find_first_index(item) with (item > 15);

                e1.q = e1.a.find_first_index with (item > 15);      //both these are same


/*
                foreach(e1.a[i])
                        begin
                                if(e1.q.size == 1)
                                        break;

                                else if(e1.a[i] > 15)
                                        e1.q.push_back(i);

                        end

*/
                $display("queue \n%p ",e1.q);




        end

endmodule



******************************************************************

module top;

class example;

rand bit[4:0] a[10];
int q[$];

//constraint c1 {}
endclass


example e1;

initial
        begin
                e1 = new();
                assert(e1.randomize);
                $display("array \n%p",e1.a);

//              e1.q = e1.a.find_last_index(item) with (item > 15);

//              e1.q = e1.a.find_last_index with (item > 15); //both these are same


/*
                for(int i = $size(e1.a) -1; i >= 0; i--)
                        begin
                                if(e1.q.size == 1)
                                        break;

                                else if(e1.a[i] > 15)
                                        e1.q.push_back(i);

                        end
*/

                $display("queue \n%p ",e1.q);




        end

endmodule




******************************************************************
only the distinct elements of an array


module top;

class example;

int a[10] = {1,2,3,4,5,6,7,7,9,10};

int u_q[$]; 
int t_q[$];

endclass


example e1;

initial
        begin
                e1 = new();
                $display("%p",e1.a);

                foreach(e1.a[i])
                    begin
                        e1.t_q = e1.a.find with (item == e1.a[i]);
                            if(e1.t_q.size == 1)
                                e1.u_q.push_back(e1.a[i]);
                            


                    end

                $display("unique array : %p",e1.u_q);

        end

endmodule

******************************************************************

unique elements of an array

module top;

class example;

int a[10] = {1,2,3,4,5,6,7,7,9,10};

int u_q[$];
int i_q[$];
int count;

endclass

example e1;

initial
        begin
                e1 = new();
                $display("%p",e1.a);

                for(int i=0; i<10; i++)
                    begin
                        for(int j=0; j<i;j++)
                            begin
                                e1.count = 0;
                                if(i!=j)
                                    begin
                                        if(e1.a[i] == e1.a[j])
                                            e1.count++;
                                    end
                            end
                        if(e1.count == 0)
                            begin
                                e1.u_q.push_back(e1.a[i]);
                                e1.i_q.push_back(i);
                            end
                    end
                $display("unique : %p",e1.u_q);
                $display("unique_indexes : %p",e1.i_q);
        end

endmodule 
