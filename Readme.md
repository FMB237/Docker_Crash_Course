# Docker Crash Course

A small, hands-on collection of examples and scripts to learn Docker basics: writing Dockerfiles (single- and multi-stage), building images, running containers, and using docker-compose. This repo includes a minimal Node example, example Dockerfiles, and installation helper scripts for Linux.

## Table of contents
- About
- Repository contents
- Prerequisites
- Quick start
- Build & run (Node app)
- Multi-stage build example
- Single-stage example (C/gcc)
- Using docker-compose
- Installation helper scripts
- Troubleshooting
- Recommended improvements
- Contributing
- License

## About
This repository is a simple Docker crash course intended to help you understand containers, images, Dockerfiles, and docker-compose through small, practical examples.

## Repository contents (high level)
- Dockerfile — Node-based Dockerfile that uses node:24, sets /app, copies index.js and runs it.
- Dockerfile-multistage — Multi-stage example that compiles a C program in a builder stage and copies the binary to a minimal runtime image.
- Dockersfile-single — Single-stage Dockerfile example (note: filename is misspelled; see Recommended improvements).
- docker-compose.yml — Minimal compose file to run services together.
- index.js, app.js — Small Node server examples used by the Dockerfile(s).
- package.json, package-lock.json — Node metadata and lockfile.
- InstallDocker.sh, InstallingDockerUbuntu.sh — Shell scripts to assist installing Docker/Desktop on Linux.
- alpine.sh — small shell example related to Alpine image usage.
- Readme.md — current project README (this will be replaced).

## Prerequisites
- Docker (Engine) and Docker CLI installed. For compose usage, either Docker Compose v1 or v2 (docker compose) is required.
- Basic command-line knowledge.
- For the Node example: Node is not required locally to build/run the Docker image, but it helps for local development.

## Quick start
1. Clone the repo:
   git clone https://github.com/FMB237/Docker_Crash_Course.git
   cd Docker_Crash_Course

2. Build the Node image:
   docker build -t docker-crash-course .

3. Run the container (example maps container port 3000 to host 3000; adjust if your app uses a different port):
   docker run --rm -p 3000:3000 docker-crash-course

4. Confirm the app:
   curl http://localhost:3000

(If the Node app listens on another port, inspect index.js or app.js and map the correct port.)

## Build & run — Node Dockerfile
The repository’s Dockerfile uses node:24 and runs index.js. Typical commands:
- Build:
  docker build -t docker-crash-course .
- Run:
  docker run --rm -p 3000:3000 docker-crash-course

Notes & suggestions:
- Consider adding EXPOSE 3000 to the Dockerfile (or whichever port the app uses).
- Consider adding a .dockerignore to reduce image build contexts (node_modules, logs, .git, etc).

## Multi-stage build example
Dockerfile-multistage demonstrates building a small C program in a builder stage and copying the compiled binary into a compact runtime image (alpine).
- Build:
  docker build -f Dockerfile-multistage -t multi-stage .
- Run:
  docker run --rm multi-stage

This pattern is useful to produce small final images by separating build dependencies from runtime images.

## Single-stage example
The file named Dockersfile-single is a single-stage example (likely intended to be Dockerfile-single). Single-stage Dockerfiles contain one set of build instructions and produce an image that contains both build and runtime artifacts. If you prefer multi-stage builds to keep final images small, use the multi-stage example.

## Using docker-compose
If you want to run multiple services (frontend, backend, db) simultaneously, use docker-compose.yml:
- Start:
  docker-compose up -d
  or, for Compose v2 plugin:
  docker compose up -d
- Stop:
  docker-compose down
- View logs:
  docker-compose logs -f <service-name>

## Installation helper scripts
- InstallDocker.sh — helper script for installing Docker Desktop / enabling KVM on Debian-based systems (Linux Mint/Ubuntu). Review the script before running. Example:
  sudo bash InstallDocker.sh

- InstallingDockerUbuntu.sh — a longer installation script tailored for Ubuntu environments. Review and run with root privileges:
  sudo bash InstallingDockerUbuntu.sh

Be careful: these scripts run privileged commands (modprobe, apt install, usermod). Inspect and adapt them for your distribution and security requirements.

## Troubleshooting
- Docker daemon not running: start Docker Desktop or run systemctl start docker (or check the docs for your OS).
- Permission errors when running Docker without sudo: add your user to the docker group: sudo usermod -aG docker $USER and log out/log in.
- KVM module not available: confirm your CPU supports virtualization and that the kernel modules exist (kvm_intel or kvm_amd).
- Port conflicts: if port 3000 (or another) is in use, map another host port (e.g. -p 8080:3000).

## Recommended improvements
- Rename files for clarity: Dockersfile-single -> Dockerfile-single.
- Update/replace the repository Readme.md with this README.
- Add a .dockerignore to exclude node_modules, *.log, .git, etc.
- Add EXPOSE <port> to Dockerfiles and ensure the app reads port from env var (PORT) for flexibility:
  Example in Node: const port = process.env.PORT || 3000
- Add healthcheck and non-root user in Dockerfile for better security.
- Lint & format shell scripts; add safety checks (existence of required files, distribution detection).
- Add a CONTRIBUTING.md and LICENSE file (e.g., MIT) if you want public contributions.
- Add CI (GitHub Actions) that builds the images and runs basic smoke tests.

## Contributing
1. Fork the repo.
2. Create a branch: git checkout -b fix/readme
3. Make changes and open a PR describing your changes.

Please include clear commit messages and, when appropriate, tests or demonstration steps.
