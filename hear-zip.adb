with Graph;

procedure Hear is
   use Graph;
   G: Tower_List;

   Command, A, B: String(1..20);
begin
   Initialize_List(G);

   loop
      -- Read command
      Put("Enter command: ");
      Get_Line(Command);

      exit when Command = "exit";

      -- Parse command
      if Command(Command'First..Command'First+1) = "##" then
         Put_Line(Can_Communicate(G, A, B));
      elsif Command(Command'Last) = '.' then
         A := Command(Command'First..Command'Last-1);
         B := Command(Command'Last-1..Command'Last+1);
         Add_Connection(G, A, B);
      elsif Command(Command'Last) = '#' then
         A := Command(Command'First..Command'Last-1);
         B := Command(Command'Last-1..Command'Last+1);
         Remove_Connection(G, A, B);
      end if;
   end loop;
end Hear;
