with Ada.Strings.Unbounded, Ada.Containers.Doubly_Linked_Lists, Ada.Text_IO;
use Ada.Strings.Unbounded, Ada.Text_IO;

package Treeo is
        package Liste is new Ada.Containers.Doubly_Linked_Lists(Element_Type => Unbounded_String);
        use Liste;
        M: constant := 4;
        subtype Indice is Integer range 0..M;

        type Tree is private;
        type Alphabet is array(97..122) of Natural;
        type AlphabetOpt is ('e','a','i','s','t','n','r','u','l','o','d','m','p','c','v','q','g','b','f','j','h','z','x','y','k','w');
        function New_Tree return Tree;
        procedure Insertion(T : in out Tree ; Word : in String);
        procedure Search_And_Display(T : in Tree ; Letters : in String);
        procedure Insertion_Rec(T : in out Tree ; Word : in String ; OccLetter : in Alphabet);
        procedure Search_And_Display_rec(T : in Tree ; Letters : in String ; OccLetter : in Alphabet);
        function Succ(C: in Character) return Character;

        private
        type Node;
        type Tree is access Node;
        type Tab is array(Indice) of Tree;
        type Node is record
                Fils : Tab;
                letter: character;
                L: Liste.List;
        end record;
end Treeo;
