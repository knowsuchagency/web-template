from django.db import models
from nanodjango import Django

app = Django()

@app.admin
class CountLog(models.Model):
    timestamp = models.DateTimeField(auto_now_add=True)

@app.route("/")
def count(request):
    # Standard Django function view
    CountLog.objects.create()
    return f"<p>Number of requests: {CountLog.objects.count()}</p>"

@app.api.get("/add")
def count(request):
    # Django Ninja API
    CountLog.objects.create()
    return {"count": CountLog.objects.count()}