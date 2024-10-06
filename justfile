# list available commands
list:
    @just --list

# run backend server in development mode
runserver:
    uv run nanodjango run app.py

# run backend server in production mode
backend:
    uv run granian --interface asginl --port 8000 --host 0.0.0.0 app:app.asgi
