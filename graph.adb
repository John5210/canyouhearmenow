with Doubly_Linked_Lists;

package body Graph is
   use Doubly_Linked_Lists;

   type Tower is record
      Name: String(1..20);
      Connections: List;
   end record;

   type Tower_List is new List;

   function Find_Tower(List: in Tower_List; Name: in String) return Node_Ptr is
      Current: Node_Ptr := List.First;
   begin
      while Current /= null and then Current.Data.Name /= Name loop
         Current := Current.Next;
      end loop;
      return Current;
   end Find_Tower;

   procedure Add_Connection(Graph: in out Tower_List; A, B: in String) is
      Node_A, Node_B: Node_Ptr;
   begin
      Node_A := Find_Tower(Graph, A);
      Node_B := Find_Tower(Graph, B);

      if Node_A = null then
         Initialize_List(Node_A.Data.Connections);
         Node_A.Data.Name := A;
         Insert_Last(Graph, Node_A.Data);
      end if;

      if Node_B = null then
         Initialize_List(Node_B.Data.Connections);
         Node_B.Data.Name := B;
         Insert_Last(Graph, Node_B.Data);
      end if;

      Insert_Last(Node_A.Data.Connections, Node_B.Data);
   end Add_Connection;

   procedure Remove_Connection(Graph: in out Tower_List; A, B: in String) is
      Node_A, Node_B: Node_Ptr;
   begin
      Node_A := Find_Tower(Graph, A);
      Node_B := Find_Tower(Graph, B);

      if Node_A /= null and then Node_B /= null then
         Remove_Last(Node_A.Data.Connections);
      end if;
   end Remove_Connection;

   function Can_Communicate(Graph: Tower_List; A, B: String) return String is
      Node_A, Node_B: Node_Ptr;
      Result: String(1..30);
   begin
      Node_A := Find_Tower(Graph, A);
      Node_B := Find_Tower(Graph, B);

      if Node_A = null or else Node_B = null then
         Result := "- Towers not found.";
      else
         while Node_A /= null and then Node_A /= Node_B loop
            Node_A := Last_Element(Node_A.Data.Connections);
         end loop;

         if Node_A = Node_B then
            Result := "+ " & A & " => " & B;
         else
            Result := "- No communication path.";
         end if;
      end if;

      return Result;
   end Can_Communicate;

end Graph;
