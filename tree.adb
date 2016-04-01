package body tree is

	function New_Tree return Tree is
	Begin
		return new Node'((others => null), 'a', Empty_list);
	End;

	procedure Insertion(T : in out Tree ; Word : in String) is
		tabl : alphabet := (others => 0);
	begin
		for I in Word'Range loop
			tabl(Character'pos(Word(I))) := tabl(Character'pos(Word(I))) + 1;
			if tabl(Character'pos(Word(I))) > M then
				return;
			end if;
		end loop;
		Insertion_Rec(T , Word, tabl);
	End Insertion;


	procedure Insertion_Rec(T : in out Tree ; Word : in String ; OccLetter : Alphabet) is
	begin
		if T.Letter = '{' then				--Si on est sur une feuille alors on ajoute dans la liste le WORD
			T.L.Append(To_Unbounded_String(Word));
		else	
			if T.Fils(OccLetter(Character'Pos(T.Letter))) = null then		--Si le fils n'existe pas on le crée
				T.Fils(OccLetter(Character'Pos(T.Letter))) := new Node'((others=>null), character'Succ(T.Letter), Empty_list);
			end if;
			Insertion(T.Fils(OccLetter(Character'Pos(T.Letter))), Word);	--Appel recursif vers le fils suivant
		end if;
	end Insertion_Rec;

	procedure display(L : List) is
		C: Liste.Cursor := First(L);
	begin
		while Has_Element(C) loop
			Put("[" & To_String(Element(C)) & "] , ");
			Next(C);
		end loop;
	end display;


	procedure Search_And_Display(T : in Tree ; Letters : in String) is
		compteur : Natural := 0;
	begin
		if(T /= null and then T.Letter /= '{') then
			for I in Letters'Range loop
				If Letters(I) = T.Letter and compteur < M then
					Search_And_Display(T.Fils(compteur), Letters);
					Compteur := Compteur + 1;
				end if;
			end loop;
			Search_And_Display(T.Fils(Compteur), Letters);
		elsif T /= null then
			display(T.L);
		end if;
	end Search_And_Display;

end tree;
--En Une Page maggle!
--Et il reste même de la place!
