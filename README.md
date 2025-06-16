# 🐳 Red de Servicios en Docker

Este proyecto implementa una red interna de servicios esenciales utilizando Docker. Está diseñada para ser auto-contenida, reproducible y completamente aislada del sistema anfitrión. Todos los contenedores están conectados mediante una red `bridge` personalizada con IPs fijas, sin necesidad de modificar archivos como `/etc/hosts`.

## 📌 Objetivo

Simular una red corporativa o institucional en la que se integran servicios clave como proxy, web, DNS y firewall, facilitando prácticas de administración y pruebas de red con políticas de control y filtrado.

## 🧱 Servicios Implementados

- **🔐 Proxy (Squid)**  
  Filtrado HTTP con listas negras por dominio y palabras clave. Expone el puerto `3128`.  
  Uso: navegación controlada mediante proxy transparente o explícito.

- **🌐 Servidor Web (Apache)**  
  Virtual Hosts configurados para servir tres sitios distintos (`site1.localnet`, `site2.localnet`, `site3.localnet`) desde el mismo contenedor.

- **🧭 Servidor DNS (BIND9)**  
  Resolución autoritativa de dominios `.localnet` de forma interna. No depende de resolutores externos.

- **🧪 Cliente (Ubuntu personalizado)**  
  Herramientas de red, scripts de prueba y reglas de firewall aplicadas directamente con `iptables`. Punto de entrada para validar la red.

## ⚙️ Requisitos

- Docker Desktop (recomendado: con WSL en Windows)
- Git
- Terminal bash o compatible
- Visual Studio Code (opcional)

## 🚀 Instrucciones de uso

1. **Clona este repositorio:**

   ```bash
   git clone https://github.com/reDragonCoder/red-de-servicios-en-docker.git
   cd red-de-servicios-en-docker
   ```

2. **Construye y levanta los servicios:**

   ```bash
   docker-compose build
   docker-compose up -d
   ```

3. **Aplica reglas de iptables y ejecuta pruebas (desde test-client):**

   ```bash
   docker exec test-client /root/iptables-apply.sh
   docker exec test-client /root/test.sh
   ```

4. **Apaga la red al terminar:**

   ```bash
   docker-compose down
   ```

## 🧪 Pruebas Incluidas

Dentro del contenedor `test-client`, se pueden ejecutar pruebas para validar:

- ✅ Bloqueo de tráfico HTTP (puerto 80)
- ✅ Bloqueo de tráfico FTP (puerto 21)
- ✅ Bloqueo de tráfico hacia el rango de IPs 192.168.0.10–100
- ✅ Bloqueo de respuestas ICMP Echo-Reply (ping)
- ✅ Bloqueo de conexiones SMTP (puerto 25) simuladas por IP

## 📁 Estructura del proyecto

```
├── proxy/            # Contenedor Squid con blacklist y bloqueo ICMP
├── web/              # Apache con Virtual Hosts para 3 sitios
├── dns/              # Servidor BIND9 autoritativo para .localnet
├── client/           # Cliente de pruebas con iptables y scripts
├── docker-compose.yml
```

## 📬 Contacto

Proyecto realizado con fines educativos.  
Autor: reDragonCoder  
GitHub: [https://github.com/reDragonCoder](https://github.com/reDragonCoder)

---

> 💡 *Todos los servicios están completamente contenidos y configurados para ser ejecutados sin depender del sistema anfitrión, lo que garantiza portabilidad y consistencia entre entornos.*
