# SQL-Database-project
 

Ovaj projekat je fokusiran na rad sa bazom podataka i uključuje sledeće komponente:
- Kreiranje pogleda
- Dnevnik tabela (journal tables)
- Trigeri
- Izveštaji

## Kreiranje Pogona

### Pogled: Top 3 Menadžera

Ovaj pogled prikazuje top 3 menadžera koji su kreirali najjeftinije aranžmane u agenciji.

```sql
CREATE OR REPLACE VIEW TopMenadzeri AS
SELECT *
FROM (
  SELECT m.mbr, m.ime, m.prezime, SUM(c.iznos) AS ukupno_iznos
  FROM Menadzer m
  LEFT OUTER JOIN Ponuda p ON m.mbr = p.mbr
  LEFT OUTER JOIN Aranzman a ON p.idponud = a.idaranz
  LEFT OUTER JOIN Ima_Cenu ic ON a.idaranz = ic.idaranz
  LEFT OUTER JOIN Cena c ON ic.idcena = c.idcena
  GROUP BY m.mbr, m.ime, m.prezime
  ORDER BY SUM(c.iznos) ASC
) WHERE ROWNUM <= 3;
