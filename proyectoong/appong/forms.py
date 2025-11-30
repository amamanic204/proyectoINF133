from django import forms
from .models import Evento, Voluntario, Inscripcion, Asistencia

class EventoForm(forms.ModelForm):
	class Meta:
		model = Evento
		fields = ['nombre', 'proposito', 'fecha_inicio', 'fecha_fin']

class VoluntarioForm(forms.ModelForm):
	class Meta:
		model = Voluntario
		fields = ['ci', 'nombre', 'apellido', 'fecha_nacimiento', 'correo', 'telefono']

class InscripcionForm(forms.ModelForm):
	class Meta:
		model = Inscripcion
		fields = ['id_evento', 'id_voluntario', 'rol']

class AsistenciaForm(forms.ModelForm):
	class Meta:
		model = Asistencia
		fields = ['id_evento', 'id_voluntario', 'hora_llegada', 'hora_salida']
		
# id_voluntario
# ci
# nombre
# apellido
# fecha_nacimiento
# correo
# telefono


# id_inscripcion
# id_evento
# id_voluntario
# rol 

# id_asistencia
# id_evento
# id_voluntario
# hora_llegada
# hora_salida
