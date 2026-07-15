#!/usr/bin/env bash
set -euo pipefail

echo "=== NovaTech Lab K-06: Umgebung wird vorbereitet ==="

echo "Prüfe Docker ..."
docker info >/dev/null 2>&1 || { echo "Docker ist nicht verfügbar."; exit 1; }

echo "Prüfe Kubernetes-Cluster ..."
if ! minikube status >/dev/null 2>&1; then
  echo "Starte minikube-Cluster ..."
  minikube start \
    --driver=docker \
    --cpus=2 \
    --memory=4096
fi

echo "Warte auf Ready-Status aller Nodes ..."
kubectl wait \
  --for=condition=Ready \
  nodes \
  --all \
  --timeout=180s

echo "Erstelle Namespace novatech-dev ..."
kubectl create namespace novatech-dev \
  --dry-run=client \
  -o yaml | \
  kubectl apply -f -

echo "Prüfe verfügbare StorageClasses ..."
kubectl get storageclass

echo ""
echo "=== Kubernetes-Cluster ist bereit ==="
kubectl get nodes
