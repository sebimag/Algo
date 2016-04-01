with Ada.Strings.Unbounded, Ada.Text_IO;
use Ada.Strings.Unbounded, Ada.Text_IO;
with Ada.Containers.Doubly_Linked_Lists;



package Tree is
        package Liste is new Ada.Containers.Doubly_Linked_Lists(Element_Type => Unbounded_String);
        use Liste;
        M: constant := 3;
        subtype Indice is Integer range 0..M;

        type Tree is private;
        function New_Tree return Tree;
        procedure Insertion(T : in out Tree ; Word : in String);
        procedure Search_And_Display(T : in Tree ; Letters : in String);

private
        type Node;
        type Tree is access Node;
        type Tab is array(Indice) of Tree;
        type Node is record
           Fils : Tab;
           letter: character;
           L: Liste.List;
        end record;
end Tree;
