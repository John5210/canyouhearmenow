generic
   type Element_Type is private;

package Doubly_Linked_Lists is
   type Node;

   type List is limited private;

   procedure Initialize_List(L: out List);
   procedure Insert_Last(L: in out List; E: in Element_Type);
   procedure Remove_Last(L: in out List);
   function Is_Empty(L: List) return Boolean;
   function Last_Element(L: List) return Element_Type;

private
   -- Implementation details go here
   type Node_Ptr is access Node;

   type Node is record
      Data: Element_Type;
      Next, Prev: Node_Ptr := null;
   end record;

   type List is record
      First, Last: Node_Ptr := null;
   end record;
end Doubly_Linked_Lists;
