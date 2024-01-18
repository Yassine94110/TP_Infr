# Utilisez une image de base appropriée
FROM ubuntu:latest

# Installez Ethereum
RUN apt-get update && apt-get install -y ethereum

# Exposez les ports Ethereum (par exemple, 8545 et 30303)
EXPOSE 8545 30303

# Commande pour démarrer le nœud Ethereum
CMD ["geth", "--http", "--http.port", "8545", "--http.addr", "0.0.0.0"]
