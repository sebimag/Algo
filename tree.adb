
package body tree is

        function New_Tree return Tree is
                T: Tree;
        Begin
                T := new Node'((others => null), 'A', Empty_list);
                return T;
        End;

        procedure Insertion(T : in out Tree ; Word : in String) is
           Compteur: Natural:= 0;
           Nouveau_Noeud: Tree;
        begin
           if T.Letter = '[' then
              T.L.Append(To_Unbounded_String(Word));
           else
              for I in 0..(Length(To_Unbounded_String(Word))-1) loop
                 if Word(I) = T.letter then
                    Compteur:= Compteur + 1;
                 end if;
              end loop;
              if T.Fils(Compteur) = null then
                 Nouveau_Noeud:= new Node'((others=>null), character'Succ(T.Letter), Empty_list);
                 T.Fils(Compteur):= Nouveau_Noeud;
              end if;
              Insertion(T.Fils(Compteur), Word);
           end if;
        End;


	procedure display(L : List) is
	Begin
		Put(L(First(L)));
	End;

        procedure Search_And_Display(T : in Tree ; Letters : in String) is
        compteur : Natural := 0;
	Begin
            if (T.Letter /= '{') then
                for I in 0..(Length(To_Unbounded_String(Letters))-1) loop
                    If (Letters(I) = T.Letter) then
                        Compteur := Compteur + 1;
                    end if;
                end loop;
                Search_And_Display(T.Fils(Compteur), Letters);
            else
		put(Letters);
                display(T.l);
            end if;

        End;
end tree;
