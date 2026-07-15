# NovaTech Datenbank-Backup-Strategie

## Aufgabe
Entwirf eine Backup-Strategie für NovaTechs PostgreSQL in Kubernetes:

1. **Backup-Tool**: pg_dump oder Volume Snapshots? Vor- und Nachteile?
2. **Frequenz**: Wie oft? (z.B. stündlich, täglich)
3. **Aufbewahrung**: Wie lange? (z.B. 7 Tage, 30 Tage)
4. **Wiederherstellung**: Wie stellst du ein Backup wieder her?
5. **Automatisierung**: CronJob in Kubernetes?

## Bonus: CronJob-Manifest
Erstelle ein Kubernetes-CronJob-Manifest, das täglich um 2:00 Uhr ein pg_dump ausführt.
