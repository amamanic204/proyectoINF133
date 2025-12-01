from django.shortcuts import render, redirect, get_object_or_404
from .models import Evento, Voluntario, Inscripcion, Asistencia
from .forms import EventoForm, VoluntarioForm, InscripcionForm, AsistenciaForm

# Create your views here.
def principal(request):
	return render(request, 'appong/principal.html')

#  CRUD Eventos
def listar_eventos(request):
	eventos = Evento.objects.all()
	return render(request, 'appong/Eventos/lista_eventos.html', { 'eventos': eventos })
def crear_evento(request):
	if request.method == 'POST':
		form = EventoForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('eventos')
	else:
		form = EventoForm()
		return render(request, 'appong/Eventos/nuevo_evento.html', { 'form': form })
def eliminar_evento(request, id):
	evento = get_object_or_404(Evento, id_evento=id)
	evento.delete()
	return redirect('eventos')
def modificar_evento(request, id):
	evento = get_object_or_404(Evento, id_evento=id)
	if request.method == 'POST':
		form = EventoForm(request.POST)
		if form.is_valid():
			evento.nombre = form.cleaned_data['nombre']
			evento.proposito = form.cleaned_data['proposito']
			evento.fecha_inicio = form.cleaned_data['fecha_inicio']
			evento.fecha_fin = form.cleaned_data['fecha_fin']
			evento.save()
			return redirect('eventos')
	else:
		form = EventoForm(initial={
			'nombre': evento.nombre,
			'proposito': evento.proposito,
			'fecha_inicio': evento.fecha_inicio,
			'fecha_fin': evento.fecha_fin,
		})
		return render(request, 'appong/Eventos/actualizar_evento.html', { 'form': form })

#  CRUD Voluntarios
def listar_voluntarios(request):
	voluntarios = Voluntario.objects.all()
	return render(request, 'appong/Voluntarios/lista_voluntarios.html', { 'voluntarios': voluntarios })
def crear_voluntario(request):
	if request.method == 'POST':
		form = VoluntarioForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('voluntarios')
	else:
		form = VoluntarioForm()
		return render(request, 'appong/Voluntarios/nuevo_voluntario.html', { 'form': form })
def eliminar_voluntario(request, id):
	voluntario = get_object_or_404(Voluntario, id_voluntario=id)
	voluntario.delete()
	return redirect('voluntarios')
def modificar_voluntario(request, id):
	voluntario = get_object_or_404(Voluntario, id_voluntario=id)
	if request.method == 'POST':
		form = VoluntarioForm(request.POST)
		if form.is_valid():
			voluntario.ci = int(form.cleaned_data['ci'])
			voluntario.nombre = form.cleaned_data['nombre']
			voluntario.apellido = form.cleaned_data['apellido']
			voluntario.fecha_nacimiento = form.cleaned_data['fecha_nacimiento']
			voluntario.correo = form.cleaned_data['correo']
			voluntario.telefono = int(form.cleaned_data['telefono'])
			voluntario.save()
			return redirect('voluntarios')
	else:
		print('-------------------------')
		print(voluntario.fecha_nacimiento)
		form = VoluntarioForm(initial={
			'ci': voluntario.ci,
			'nombre': voluntario.nombre,
			'apellido': voluntario.apellido,
			'fecha_nacimiento': voluntario.fecha_nacimiento,
			'correo': voluntario.correo,
			'telefono': voluntario.telefono,
		})
		return render(request, 'appong/Voluntarios/actualizar_voluntario.html', { 'form': form })

#  CRUD Inscripciones
def listar_inscripciones(request):
	inscripciones = Inscripcion.objects.all()
	return render(request, 'appong/Inscripciones/lista_inscripciones.html', { 'inscripciones': inscripciones })

def crear_inscripcion(request):
	if request.method == 'POST':
		form = InscripcionForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('inscripciones')
	else:
		form = InscripcionForm()
		return render(request, 'appong/Inscripciones/nueva_inscripcion.html', { 'form': form })
def eliminar_inscripcion(request, id):
	inscripcion = get_object_or_404(Inscripcion, id_inscripcion=id)
	inscripcion.delete()
	return redirect('inscripciones')
def modificar_inscripcion(request, id):
	inscripcion = get_object_or_404(Inscripcion, id_inscripcion=id)
	if request.method == 'POST':
		form = InscripcionForm(request.POST)
		if form.is_valid():
			inscripcion.evento = form.cleaned_data['evento']
			inscripcion.voluntario = form.cleaned_data['voluntario']
			inscripcion.rol = form.cleaned_data['rol']
			inscripcion.save()
			return redirect('inscripciones')
	else:
		form = InscripcionForm(initial={
			'evento': inscripcion.evento,
			'voluntario': inscripcion.voluntario,
			'rol': inscripcion.rol,
		})
		return render(request, 'appong/Inscripciones/actualizar_inscripcion.html', { 'form': form })

#  CRUD Asistencias
def listar_asistencias(request):
	asistencias = Asistencia.objects.all()
	return render(request, 'appong/Asistencias/lista_asistencias.html', { 'asistencias': asistencias })
def crear_asistencia(request):
	if request.method == 'POST':
		form = AsistenciaForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('asistencias')
	else:
		form = AsistenciaForm()
		return render(request, 'appong/Asistencias/nueva_asistencia.html', { 'form': form })
def eliminar_asistencia(request, id):
	asistencia = get_object_or_404(Asistencia, id_asistencia=id)
	asistencia.delete()
	return redirect('asistencias')
def modificar_asistencia(request, id):
	asistencia = get_object_or_404(Asistencia, id_asistencia=id)
	if request.method == 'POST':
		form = AsistenciaForm(request.POST)
		if form.is_valid():
			asistencia.evento = form.cleaned_data['evento']
			asistencia.voluntario = form.cleaned_data['voluntario']
			asistencia.hora_llegada = form.cleaned_data['hora_llegada']
			asistencia.hora_salida = form.cleaned_data['hora_salida']
			asistencia.save()
			return redirect('asistencias')
	else:
		form = AsistenciaForm(initial={
			'evento': asistencia.evento,
			'voluntario': asistencia.voluntario,
			'hora_llegada': asistencia.hora_llegada,
			'hora_salida': asistencia.hora_salida,
		})
		return render(request, 'appong/Asistencias/actualizar_asistencia.html', { 'form': form })

#Funcionalidad Voluntarios
#Horas Acumuladas de Voluntarios
def horas_acumuladas(request):
    voluntarios = Voluntario.objects.all()
    if request.method == 'POST':
        id_voluntario = request.POST.get('voluntario')
        if id_voluntario:
            return redirect('ver_horas_voluntario', id_voluntario = id_voluntario)
    return render(request, 'appong/Funcionalidades/form_horas_acumuladas.html', {"voluntarios" : voluntarios})

def ver_horas_voluntario(request, id_voluntario):
	voluntario = get_object_or_404(Voluntario, id_voluntario=id_voluntario)
	return render(request, 'appong/Funcionalidades/horas_acumuladas.html', { 'voluntario': voluntario })

#Cambiar Rol
def cambiar_rol(request, id_voluntario):
    voluntario = get_object_or_404(Voluntario, id_voluntario=id_voluntario)
    if request.method == 'POST':
        voluntario.rol = 'Cocina' if voluntario.rol == 'Logistica' else 'Logistica'
        voluntario.save()
        return redirect('listar_voluntarios')
    return render(request, 'appong/Voluntarios/cambiarRol.html', {'voluntario': voluntario})

# Mostrar hoja de asistencia del evento x
def hoja_asistencia_evento(request, id):
	evento = get_object_or_404(Evento, id_evento=id)
	asistencias = Asistencia.objects.filter(evento=evento)
	return render(request, 'appong/Funcionalidades/hoja_asistencia.html', {'asistencias':asistencias, 'evento':evento})

# mostrar eventos participados por el voluntario x
def eventos_participados(request, id):
	voluntario = get_object_or_404(Voluntario, id_voluntario=id)
	inscripciones = Inscripcion.objects.filter(voluntario=voluntario)
	return render(request, 'appong/Funcionalidades/eventos_participados.html', {'inscripciones': inscripciones, 'voluntario':voluntario})
