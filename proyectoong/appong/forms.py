from django import forms
from .models import Evento, Voluntario, Inscripcion, Asistencia

class EventoForm(forms.ModelForm):
	class Meta:
		model = Evento
		fields = ['nombre', 'proposito', 'fecha_inicio', 'fecha_fin']
		widgets = {
			'fecha_inicio': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
			'fecha_fin': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
		}

class VoluntarioForm(forms.ModelForm):
	class Meta:
		model = Voluntario
		fields = ['ci', 'nombre', 'apellido', 'fecha_nacimiento', 'correo', 'telefono']
		widgets = {
			'fecha_nacimiento': forms.DateInput(attrs={'type': 'date'}),
			'correo': forms.EmailInput(attrs={'type': 'email'}),
		}

class InscripcionForm(forms.ModelForm):
	class Meta:
		model = Inscripcion
		fields = ['evento', 'voluntario', 'rol']

class AsistenciaForm(forms.ModelForm):
	class Meta:
		model = Asistencia
		fields = ['evento', 'voluntario', 'hora_llegada', 'hora_salida']
		widgets = {
			'hora_llegada': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
			'hora_salida': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
		}