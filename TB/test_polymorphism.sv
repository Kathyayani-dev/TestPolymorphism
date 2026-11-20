# code for test_polymorphism
  ...
     module test_polymorphism;


        // In class packet_c
        class packet_c;
                // In task send
                virtual task send;
                        // Display message "Sending base class packet"
                        $display("sending base class packet");
                endtask

        endclass
        // Extend badpacket_c from packet_c
        class badpacket_c extends packet_c;
                // Override task send
                task send;
                        // Display message "Sending derived class packet"
                        $display("sending derived class packet");
                endtask
        endclass

        // Within initial
        initial
        begin
                // Create instances for badpacket_c and packet_c
                badpacket_c bad_c=new();
                packet_c pkt_c=new();
                // Call send tasks using base and extended class handles
                bad_c.send;
                pkt_c.send;
                // Assign extended class handle to base class handle
                pkt_c=bad_c;
                // Call send task using base class object
                pkt_c.send;
        end

     endmodule
...
