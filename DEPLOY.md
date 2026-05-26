# Deploy Execution Gap

Execution Gap is a Python web app with a SQLite database. It cannot be hosted as a static-only site because tasks, goals, journals, reviews, and archive data are saved through the backend API.

## Public Always-On Webpage

Deploy this project as a Python web service.

Required run command:

```bash
python run.py web --host 0.0.0.0 --port $PORT --db /var/data/execution_gap.sqlite3
```

Required persistent storage:

```text
/var/data
```

The included `render.yaml` config creates a Python web service with a 1 GB persistent disk mounted at `/var/data`.

## Docker Hosting

You can also run it anywhere Docker is available:

```bash
docker compose up -d --build
```

The included `docker-compose.yml` stores the database in:

```text
./data/execution_gap.sqlite3
```

and restarts the app automatically unless you stop it.

Open:

```text
http://localhost:8765
```

On a VPS or always-on computer, point your domain or reverse proxy to port `8765`.

## Local Network Webpage

If you only need access from your own devices while this computer is on, run:

```powershell
.\start_public_local.bat
```

Then visit:

```text
http://YOUR-COMPUTER-IP:8765
```

This is not the same as internet hosting. It works while your computer is awake, the app is running, and your firewall allows the port.

## Start Automatically On Windows

To make the app start whenever you log into Windows:

```powershell
.\install_startup_task.bat
```

The app will run at:

```text
http://127.0.0.1:8765
```

and store data in:

```text
.\data\execution_gap.sqlite3
```

Do not run `.\data\execution_gap.sqlite3` in PowerShell. That file is the SQLite database. Start the app with:

```powershell
.\start_always_local.bat
```

Then open:

```powershell
.\open_app.bat
```

To remove the startup task:

```powershell
.\uninstall_startup_task.bat
```
