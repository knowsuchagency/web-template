# list available commands
list:
    @just --list

# run backend server in development mode
runserver:
    uv run nanodjango run app.py

# run backend server in production mode
granian:
    uv run granian --interface asginl --port 8000 --host 0.0.0.0 app:app.asgi

# run frontend server in development mode
frontend:
    cd frontend && npm run dev

# run backend and frontend in development mode
dev:
    npx concurrently \
        -n "nanodjango,frontend" \
        -c "blue,green" \
        "just runserver" "just frontend"
