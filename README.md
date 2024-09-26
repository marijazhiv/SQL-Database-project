# SQL-Database-project
 

Ovaj projekat je fokusiran na rad sa bazom podataka i uključuje sledeće komponente:
- Kreiranje tabela
- Kreiranje pogleda
- Dnevnik tabela (journal tables)
- Trigeri
- Izveštaji

## Kreiranje Pogleda

### Pogled: Top 3 Menadžera

Pogled prikazuje top 3 menadžera koji su kreirali najjeftinije aranžmane u agenciji.

 ## Zurnal Tabela
 Tabela Aranzman_Log se koristi za beleženje svih promena u tabeli Aranzman (zakazani, otkazani, odlozeni...).

 ## Trigeri
### Kreiranje Trigera za Zurnal Tabelu
Triger Aranzman_Trigger automatski beleži sve INSERT, UPDATE, ili DELETE operacije na tabeli Aranzman u tabeli Aranzman_Log.

## Izveštaji
### Kreiranje Procedura za Izveštaj
Procedura Izvestaj_Dest_Aranz generiše izveštaj koji prikazuje sve aranžmane za svaku destinaciju (koristeći prethodno kreirane Kursore).


