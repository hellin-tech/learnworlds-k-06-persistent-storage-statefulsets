# K-06: Persistent Storage & StatefulSets

## NovaTech-Szenario
Tom hat den PostgreSQL-Pod im Dev-Cluster neu gestartet – alle Testdaten sind weg. Container-Filesysteme sind flüchtig. Nina erinnert sich: "In Docker Compose hatten wir ein Volume!" Kubernetes hat ein ähnliches, aber komplexeres Konzept: PersistentVolumes, PersistentVolumeClaims und StatefulSets.

## Lernziele
- Ephemeral vs. persistent Storage verstehen
- PersistentVolumes (PV) und PersistentVolumeClaims (PVC) konfigurieren
- StorageClasses und dynamische Provisionierung kennenlernen
- StatefulSets für Datenbanken einsetzen

## Aufgaben

### Aufgabe 1: Datenverlust erleben
Starte PostgreSQL ohne PVC, schreibe Daten, lösche den Pod → Daten weg (`aufgaben/01_ohne_pvc.sh`).

### Aufgabe 2: PVC erstellen
Erstelle PVC und PostgreSQL-Deployment mit persistentem Storage (`aufgaben/postgres-pvc.yaml`, `aufgaben/postgres-deployment.yaml`).

### Aufgabe 3: StatefulSet
Erstelle ein StatefulSet mit volumeClaimTemplates (`aufgaben/postgres-statefulset.yaml`).

### Aufgabe 4: Backup-Strategie
Dokumentiere eine Backup-Strategie in `aufgaben/backup-strategie.md`.

## Lösung
Musterlösungen im Ordner `loesung/`.
