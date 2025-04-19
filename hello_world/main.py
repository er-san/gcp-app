"""main entrypoint"""

from fastapi import FastAPI
import uvicorn

app = FastAPI()


@app.get("/")
def base_path():
    """handle base path GET request."""
    return {"message": "Hello World"}


def run():
    """run application."""
    uvicorn.run("hello_world.main:app", host="0.0.0.0", port=8080)
