package body tree is

        function New_Tree return Tree is
        Begin
                return new Node'((others => null), 'a', Empty_list);
        End;

        procedure Insertion(T : in out Tree ; Word : in String) is
           Compteur: Natural:= 0;
        begin
           if T.Letter = '{' then
              T.L.Append(To_Unbounded_String(Word));
           else
              for I in Word'Range loop
                 if Word(I) = T.Letter then
                    Compteur:=Compteur+1;
                 end if;
              end loop;
              if T.Fils(Compteur) = null then
                 T.Fils(Compteur) := new Node'((others=>null), character'Succ(T.Letter), Empty_list);
              end if;
              Insertion(T.Fils(Compteur), Word);
           end if;
        end insertion;

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
                 If Letters(I) = T.Letter then
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
