# 🐳 Docker Service Network

This project implements an internal network of essential services using Docker. It is designed to be self-contained, reproducible, and completely isolated from the host system. All services are deployed as containers within the same isolated network.

## 📌 Objective

Simulate a corporate or institutional network integrating key services like proxy, web, DNS, and firewall, enabling network administration practices and testing with access control policies.

## 🧱 Implemented Services

- **🔐 Proxy (Squid)**  
  HTTP filtering with blacklist by domain and keywords. Exposes port `3128`.  
  Usage: controlled browsing via transparent or explicit proxy.

- **🌐 Web Server (Apache)**  
  Virtual Hosts configured to serve three different sites (`site1.localnet`, `site2.localnet`, `site3.localnet`) from the same container.

- **🧭 DNS Server (BIND9)**  
  Authoritative resolution of `.localnet` domains internally. Does not depend on external resolvers.

- **🧪 Client (Custom Ubuntu)**  
  Network tools, test scripts, and firewall rules applied directly with `iptables`. Entry point to validate the network.

## ⚙️ Requirements

- Docker Desktop (recommended: with WSL on Windows)
- Git
- Bash-compatible terminal
- Visual Studio Code (optional)

## 🚀 Usage Instructions

1. **Clone this repository:**

   ```bash
   git clone https://github.com/reDragonCoder/docker-service-network.git
   cd docker-service-network
   ```

2. **Build and start the services:**

   ```bash
   docker-compose build
   docker-compose up -d
   ```

3. **Apply iptables rules and run tests (from test-client):**

   ```bash
   docker exec test-client /root/iptables-apply.sh
   docker exec test-client /root/test.sh
   ```

4. **Shut down the network when finished:**

   ```bash
   docker-compose down
   ```

## 🧪 Included Tests

Inside the `test-client` container, you can run tests to validate:

- ✅ Blocking HTTP traffic (port 80)
- ✅ Blocking FTP traffic (port 21)
- ✅ Blocking traffic to the IP range 192.168.0.10–100
- ✅ Blocking ICMP Echo-Reply responses (ping)
- ✅ Blocking SMTP connections (port 25) simulated by IP

## 📁 Project Structure

```
├── proxy/            # Squid container with blacklist and ICMP blocking
├── web/              # Apache with Virtual Hosts for 3 sites
├── dns/              # Authoritative BIND9 server for .localnet
├── client/           # Test client with iptables and scripts
├── docker-compose.yml
```

## 📬 Contact

Project created for educational purposes.  
Author: reDragonCoder  
GitHub: [https://github.com/reDragonCoder](https://github.com/reDragonCoder)

---

> 💡 *All services are fully contained and configured to run without depending on the host system, ensuring portability and consistency across environments.*
Autor: reDragonCoder  
GitHub: [https://github.com/reDragonCoder](https://github.com/reDragonCoder)

---

> 💡 *Todos los servicios están completamente contenidos y configurados para ser ejecutados sin depender del sistema anfitrión, lo que garantiza portabilidad y consistencia entre entornos.*
