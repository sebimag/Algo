with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Tree is
	
	M: constant := 3;
	subtype Indice is Integer range 1..M;
	type NombreFils is new Integer;

	type Node is record
		Fils : Nodes;
		nbreFils : NombreFils;
	end record;
	
	type Nodes is array(Indice) of Node;

	type Tree is private;
	function New_Tree return Tree;
	procedure Insertion(T : in out Tree ; Word : in String);
	procedure Search_And_Display(T : in Tree ; Letters : in String);

private

	type Node;
	type Tree is access Node;
end Tree;
