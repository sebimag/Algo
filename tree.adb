package body tree is

        function New_Tree return Tree is
        Begin
                return new Node'((others => null), 'a', Empty_list);
        End;

        procedure CalcOccLetter(Word : in String; MotConforme : out Natural ; OccLetter : out Alphabet) is
        begin
           OccLetter := (others => 0);
           MotConforme := 1;
           for I in Word'Range loop
                        OccLetter(Character'pos(Word(I))) := OccLetter(Character'pos(Word(I))) + 1;
                        if OccLetter(Character'pos(Word(I))) > M then
                           MotConforme := 0;
                           OccLetter(Character'pos(Word(I))) := OccLetter(Character'pos(Word(I))) - 1;
                        end if;
           end loop;
        end CalcOccLetter;

        procedure Insertion(T : in out Tree ; Word : in String) is
           OccLetter : alphabet;
           MotConforme  : Natural;
        begin
           CalcOccLetter(Word, MotConforme, OccLetter);
           if MotConforme = 1 then
              Insertion_Rec(T , Word, OccLetter);
           end if;
        End Insertion;


        procedure Insertion_Rec(T : in out Tree ; Word : in String ; OccLetter : Alphabet) is
        begin
                if T.Letter = '{' then                          --Si on est sur une feuille alors on ajoute WORD dans la liste
                        T.L.Append(To_Unbounded_String(Word));
                else
                        if T.Fils(OccLetter(Character'Pos(T.Letter))) = null then               --Si le fils n'existe pas on le crée
                                T.Fils(OccLetter(Character'Pos(T.Letter))) := new Node'((others=>null), character'Succ(T.Letter), Empty_list);
                        end if;
                        Insertion(T.Fils(OccLetter(Character'Pos(T.Letter))), Word);    --Appel recursif vers le fils suivant
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
           OccLetter : Alphabet := (others=> 0);
           MotConforme : Natural;
        begin
           CalcOccLetter(Letters, MotConforme , OccLetter);
           Search_And_Display_rec(T , Letters, OccLetter);
        end Search_And_Display;

        procedure Search_And_Display_rec(T : in Tree ; Letters : in String ; OccLetter : in Alphabet) is
        begin
           if(T /= null and then T.Letter /= '{') then
                        for I in 0..OccLetter(Character'Pos(T.Letter)) loop
                           Search_And_Display(T.Fils(I), Letters);
                        end loop;
                elsif T /= null then
                        display(T.L);
                end if;
        end Search_And_Display_rec;

end tree;
