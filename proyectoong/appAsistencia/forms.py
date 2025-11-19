from django import forms
from .models import Evento, Voluntario, Inscrito

class EventoForm(forms.Form):
	nombre_evento = forms.CharField(max_length=200)
	proposito = forms.CharField(max_length=1000)
	fecha_evento = forms.DateField()
class VoluntarioForm(forms.Form):
	nombre = forms.CharField(max_length=100)
	apellido = forms.CharField(max_length=100)
	rol = forms.CharField(max_length=100)
	ci = forms.CharField(max_length=20)
	correo = forms.EmailField(max_length=150)
	horas_acumuladas = forms.IntegerField()
class InscritoForm(forms.Form):
	nombre = forms.CharField(max_length=100)
	apellido = forms.CharField(max_length=100)
	ci = forms.CharField(max_length=20)
	fecha_nacimiento = forms.DateField()
class AsistenciaForm(forms.Form):
	eventos = Evento.objects.all()
	id_evento = forms.ChoiceField(choices={evento.id_evento: evento.id_evento for evento in eventos})
	voluntarios = Voluntario.objects.all()
	id_voluntario = forms.ChoiceField(choices={voluntario.id_voluntario: voluntario.id_voluntario for voluntario in voluntarios})
	inscritos = Inscrito.objects.all()
	id_inscrito = forms.ChoiceField(choices={inscrito.id_inscrito: inscrito.id_inscrito for inscrito in inscritos})
	hora_llegada = forms.DateTimeField()
	hora_salida = forms.DateTimeField()
