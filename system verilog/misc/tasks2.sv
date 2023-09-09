module top ;
    
    byte packet1 [1000 : 1];
    int pkt_crc;

    task automatic crc_cal (input byte packet[1000:1], ref int crc);

        for (int j=1; j<=1000; j++)

            begin
                
                crc^=packet[j];
                
            end 

    endtask

initial 
    
    begin
        crc_cal (packet1,pkt_crc);
    end

endmodule