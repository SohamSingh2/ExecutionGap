# Execution Gap Agent

A local Python and web accountability agent that tracks goals, concrete tasks, daily execution, avoidance patterns, journal entries, and weekly resets.

## Run

```powershell
python run.py init
```

## Web app

```powershell
python run.py web
```

Then open:

```text
http://127.0.0.1:8765
```

To make it available from another device on your Wi-Fi while this computer is on:

```powershell
.\start_public_local.bat
```

Then open:

```text
http://YOUR-COMPUTER-IP:8765
```

For an always-on internet webpage, deploy this folder as a Python web service. The repo includes `render.yaml`, `Procfile`, and `requirements.txt` for hosting providers that run Python services. The app should run with:

```bash
python run.py web --host 0.0.0.0 --port $PORT --db /var/data/execution_gap.sqlite3
```

Use a persistent disk for `/var/data` so your goals, tasks, journals, and archive stay saved across restarts.

To keep it running whenever you log into this Windows computer:

```powershell
.\install_startup_task.bat
```

That uses:

```text
.\data\execution_gap.sqlite3
```

as the persistent database.

Do not run the `.sqlite3` file directly. It is the database, not the app.

To start the app manually:

```powershell
.\start_always_local.bat
```

Then open:

```powershell
.\open_app.bat
```

## Core commands

```powershell
python run.py goal "Ship portfolio website" --system "Work 60 minutes daily, publish one visible improvement" --deadline 2026-06-01

python run.py task "Write homepage copy" --output "Final homepage headline, subhead, and 3 proof points" --due 2026-05-18

python run.py plan

python run.py check "I am writing the homepage headline"

python run.py done 1

python run.py review --completed "Homepage copy drafted" --avoided "Analytics setup" --why "Unclear first step" --score 75

python run.py weekly
```

## Interactive loop

```powershell
python run.py loop
```

Inside the loop:

```text
check I am writing the first draft
done 1
tasks
plan
quit
```

## Memory

By default, data is stored at:

```text
~/.execution_gap/execution_gap.sqlite3
```

Use another database with:

```powershell
python run.py --db .\local.sqlite3 plan
```
