#!/usr/bin/env bash
set -e

echo "Installing PostgreSQL..."
sudo apt update -y
sudo apt install -y postgresql postgresql-contrib

echo "Starting PostgreSQL service..."
sudo systemctl enable postgresql
sudo systemctl start postgresql

echo "Creating test database and user..."
sudo -u postgres psql -c "CREATE USER testuser WITH PASSWORD 'password';" || true
sudo -u postgres psql -c "CREATE DATABASE testdb OWNER testuser;" || true

echo "PostgreSQL setup complete."

echo "Everything is updated and installed successfully"
