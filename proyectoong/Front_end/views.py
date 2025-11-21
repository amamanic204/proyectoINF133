from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login
# Create your views here.

def index(request):
    return render(request, 'Front_end/index.html')

def cerrar_sesion(request):
    logout(request)
    return redirect('index')

def registro (request):
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            usuario = form.save(commit = False)
            usuario.is_superuser = False
            usuario.is_staff = False
            usuario.save()
            login(request,usuario)
            return redirect("principal")
    else:
        form = UserCreationForm()
    return render(request, 'Front_end/registro.html', {'form': form})