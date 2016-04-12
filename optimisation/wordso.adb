
with Ada.Text_IO, Treeo;
use Ada.Text_IO, Treeo;
--with Ada.Unchecked_Deallocation;

procedure Wordso is
        function Read_Words_File(File_Name: in String) return Treeo.Tree is
      File : File_Type;
          T : Treeo.Tree := New_Tree;
        begin
      Open(File, In_File, File_Name);
          while not End_Of_File(File) loop
                  declare
                          Line : String := Get_Line(File);
                  begin
                          Insertion(T, Line);
                  end;
          end loop;
          Close(File);
          return T;
        end Read_Words_File;

        T : Treeo.Tree;

begin
        T := Read_Words_File("american-english");
        Put_Line("Please enter some letters: ");
        while not End_Of_File(Standard_Input) loop
                declare
                        Letters : String := Get_Line(Standard_Input);
                begin
                   Search_And_Display(T, Letters);
                   new_Line(2);
                   Put_Line("Please enter some letters: ");
                end;
        end loop;
end Wordso;
