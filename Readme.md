# 🐳 Docker Containers – Crash Course (Hands‑On)

This repository contains **practical, minimal examples** designed to teach Docker fundamentals through real usage: building images, running containers, writing Dockerfiles (single‑stage & multi‑stage), and orchestrating services with Docker Compose.

The goal is not theory overload, but **learning Docker by doing**.

---

## 🚀 What you will learn

By working through this repository, you will learn how to:

* Understand **Docker images vs containers**
* Write **Dockerfiles** from scratch
* Build and run containers using the Docker CLI
* Use **multi‑stage builds** to create smaller, production‑ready images
* Run multiple services together with **docker‑compose**
* Troubleshoot common Docker & Linux issues

---

## 📦 Repository structure

```
Docker_Crash_Course/
├── Dockerfile                # Node.js Dockerfile example
├── Dockerfile-multistage     # Multi-stage build (C → Alpine)
├── Dockerfile-single         # Single-stage build example
├── docker-compose.yml        # Compose example for multi-service setup
├── index.js                  # Minimal Node.js example
├── app.js                    # Alternative Node app example
├── package.json
├── package-lock.json
├── InstallDocker.sh          # Docker install helper (Linux)
├── InstallingDockerUbuntu.sh # Docker install helper (Ubuntu)
├── alpine.sh                 # Alpine-related shell example
└── README.md
```

---

## 🧱 Prerequisites

* Docker Engine & Docker CLI installed
* Basic command‑line knowledge
* Linux, macOS, or Windows

> 💡 Node.js is **not required locally** to run the Node example — everything runs inside Docker.

---

## ⚡ Quick start

Clone the repository:

```bash
git clone https://github.com/FMB237/Docker_Crash_Course.git
cd Docker_Crash_Course
```

Build the Docker image:

```bash
docker build -t docker-crash-course .
```

Run the container:

```bash
docker run --rm -p 3000:3000 docker-crash-course
```

Test the application:

```bash
curl http://localhost:3000
```

---

## 🧪 Dockerfile – Node.js example

This Dockerfile:

* Uses the official `node` image
* Sets `/app` as the working directory
* Copies application files
* Installs dependencies
* Runs the Node server

Recommended improvements:

* Add `.dockerignore`
* Use environment variables for ports
* Add `EXPOSE 3000`

---

## 🧩 Multi‑stage build example

`Dockerfile-multistage` demonstrates a **real‑world Docker best practice**:

* Build a C program in a builder stage
* Copy only the compiled binary into a minimal Alpine runtime image

Build and run:

```bash
docker build -f Dockerfile-multistage -t multi-stage-example .
docker run --rm multi-stage-example
```

Benefits:

* Smaller image size
* Better security
* Faster deployments

---

## 🧱 Single‑stage build example

`Dockerfile-single` shows a classic single‑stage Dockerfile where build and runtime exist in the same image.

This approach is simpler but usually results in **larger images**. For production systems, multi‑stage builds are preferred.

---

## 🔗 Using Docker Compose

`docker-compose.yml` allows running multiple services together.

Start services:

```bash
docker compose up -d
```

Stop services:

```bash
docker compose down
```

View logs:

```bash
docker compose logs -f
```

Docker Compose is commonly used for:

* Backend + database setups
* Microservices
* Local development environments

---

## 🐧 Docker installation scripts

The repository includes helper scripts for Linux users:

* `InstallDocker.sh`
* `InstallingDockerUbuntu.sh`

⚠️ Always **review scripts before running**. They execute privileged commands such as package installation and user permission changes.

---

## 🛠️ Troubleshooting

Common issues and fixes:

* **Docker daemon not running** → `systemctl start docker`
* **Permission denied** → add user to docker group:

  ```bash
  sudo usermod -aG docker $USER
  ```
* **Port already in use** → change port mapping:

  ```bash
  -p 8080:3000
  ```

---

## 🌱 Suggested improvements

* Add `.dockerignore`
* Add health checks
* Run containers as non‑root user
* Add CI pipeline (GitHub Actions)
* Dockerize a real backend app (Flask, API, SaaS)

---

## 🎯 Learning outcome

After completing this crash course, you are able to:

* Confidently use Docker for local development
* Read and write Dockerfiles
* Use Docker Compose for multi‑service setups
* Prepare applications for deployment

This repository serves as a **foundation for DevOps, Cloud, and production‑ready development**.

---

## 📄 License

MIT License

---

🔥 *Built as part of a Docker Crash Course – January 2026*
