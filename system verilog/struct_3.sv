//using struct in a function


module struct_example;
  
  typedef struct {
    string name;
    bit[31:0] salary;
    integer id;
  } employee;
    
  function void print_struct(employee emp);
    $display("EMP: %p", emp);
  endfunction
  
  function employee create_struct(string name, bit [31:0] salary, integer id);
    employee emp;
    emp.name = name;
    emp.salary = salary;
    emp.id     = id;
    return emp;
  endfunction
  
  initial begin
    employee emp1, emp2;
    emp1 = create_struct("Alex",'h10000, 'd1234);
    emp2 = create_struct("John",'h12000, 'd4321);
    print_struct(emp1);
    print_struct(emp2);
  end
endmodule