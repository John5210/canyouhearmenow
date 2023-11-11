-- hear.adb
with Ada.Text_IO;
with Graph;
with Ada.Containers.Doubly_Linked_Lists;

procedure Hear is
   -- Define your types and variables here

   -- Create an instance of your graph
   G : Graph.Graph_Type := Graph.Create_Graph;

   -- Function to process queries
   procedure Process_Query(From_Node, To_Node : Graph.Node) is
   begin
      -- Implement your logic to check if there is a communication channel
      -- between From_Node and To_Node in the graph G.
      -- Output the result as described in the task.
   end Process_Query;

   -- Main program
   procedure Main is
      Input_Line : String(1..150);
      From_Node, To_Node : Graph.Node;
   begin
      loop
         -- Read input line
         Ada.Text_IO.Get_Line(Input_Line, Last => Input_Line'Last);

         -- Exit the loop if the input is empty
         exit when Input_Line'Length = 0;

         -- Parse input line and perform necessary actions
         -- You need to implement the logic for parsing and handling different cases
         -- such as adding links, removing links, and processing queries.

         -- For example:
         -- If the line ends with '?', it's a query, so call Process_Query.
         -- If the line ends with '.', it's a link, so update the graph accordingly.
         -- If the line ends with '#', it's removing a link, so update the graph accordingly.

         -- Example:
         if Input_Line(Input_Line'Last) = '?' then
            -- It's a query line
            -- Parse From_Node and To_Node from the line
            Process_Query(From_Node, To_Node);
         elsif Input_Line(Input_Line'Last) = '.' then
            -- It's a link line
            -- Parse From_Node and To_Node from the line
            -- Add the link to the graph
            Graph.Add_Edge(G, Graph.Create_Edge(From_Node, To_Node));
         elsif Input_Line(Input_Line'Last) = '#' then
            -- It's removing a link line
            -- Parse From_Node and To_Node from the line
            -- Remove the link from the graph
            -- You need to implement the logic for removing a link
         end if;

         -- Continue reading the next line
      end loop;
   end Main;

begin
   Main;
end Hear;
