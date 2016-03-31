with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

--git put et fromages!!!

package body tree is
	
	type Nodes is array(Indice) of Tree;

	type Node is record
		Fils: Nodes;
		nbrFils: Integer;
	end record;
	
	function New_Tree return Tree is
		--arbre : Node := (others => 0 ,nombreFils => 0);
	Begin
		--return arbre;
		return NULL;
	End;

	procedure Insertion(T : in out Tree ; Word : in String) is
	Begin
		NULL;
	End;

	procedure Search_And_Display(T : in Tree ; Letters : in String) is
	Begin
		NULL;
	End;

end tree;
