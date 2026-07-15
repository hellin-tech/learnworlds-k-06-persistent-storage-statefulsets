#!/bin/bash
echo "=== Datenverlust ohne PVC ==="

echo "--- Schritt 1: PostgreSQL starten (OHNE Volume) ---"
kubectl run postgres-test --image=postgres:16-alpine \
  --env=POSTGRES_PASSWORD=test123 \
  -n novatech-dev

echo ""
echo "--- Schritt 2: Warten und Daten schreiben ---"
sleep 10
kubectl exec -it postgres-test -n novatech-dev -- psql -U postgres -c \
  "CREATE TABLE sensordaten (id serial, wert float);
   INSERT INTO sensordaten (wert) VALUES (22.5), (23.1);
   SELECT * FROM sensordaten;"

echo ""
echo "--- Schritt 3: Pod löschen ---"
kubectl delete pod postgres-test -n novatech-dev

echo ""
echo "--- Schritt 4: Neuen Pod starten ---"
kubectl run postgres-test --image=postgres:16-alpine \
  --env=POSTGRES_PASSWORD=test123 \
  -n novatech-dev
sleep 10

echo ""
echo "--- Schritt 5: Daten prüfen ---"
kubectl exec -it postgres-test -n novatech-dev -- psql -U postgres -c \
  "SELECT * FROM sensordaten;" 2>&1
echo ""
echo "→ Ergebnis: Tabelle existiert nicht mehr! Daten verloren."

kubectl delete pod postgres-test -n novatech-dev
