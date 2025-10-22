from fastapi import FastAPI

app = FastAPI(title="DevOps Starter API")

@app.get("/")
def root():
    return {"status": "ok", "message": "Hello, DevOps!"}
