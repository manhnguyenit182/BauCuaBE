# Compatibility Notes (Windows First)

## Windows (Primary)

- Shell examples use PowerShell syntax where needed
- Docker Desktop is expected runtime for local containers
- localhost port mapping is the default access pattern

## Linux Equivalent

- Ensure Docker daemon service is running (systemd or distro equivalent)
- Use same compose commands and env contract
- Validate local firewall settings for exposed ports 8000, 5173, 5432, 6379

## macOS Equivalent

- Use Docker Desktop for Mac
- Use same compose files and env values
- Validate localhost resolution and port availability

## Port and Host Notes

- Backend API default: http://localhost:8000
- Frontend default: http://localhost:5173
- If ports are occupied, override host mapping in compose files and keep docs synchronized.
