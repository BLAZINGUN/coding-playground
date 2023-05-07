
            //verilog event scheduler

/*

                from previous timeslot

                active (blocking sts , continuous assignments , $display , evaluate rhs of NBA , evaluate inputs /update outputs of primitives)

                inactive (#0 blocking assignments)

                NBA (non blocking assigns)

                read-only ($monitor , $strobe , PLI/VPI calls here)*/



            //system verilog event scheduler

/*

                preponed (sample stable values)

                active (same as above)

                inactive(same as above)

                NBA (same as above)

                observed(evaluate assertions)

                reactive(execute testbench , program block statements)

                postponed(same as above)*/

