from django.shortcuts import render

# Create your views here.

def index(request):
    return render(request, 'Front_end/index.html')