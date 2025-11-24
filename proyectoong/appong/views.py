from django.shortcuts import render, redirect, get_object_or_404
from .models import Evento, Voluntario, Inscrito, Asistencia
from .forms import EventoForm, VoluntarioForm, InscritoForm, AsistenciaForm

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
			Evento.objects.create(
				nombre_evento = form.cleaned_data['nombre_evento'],
				proposito = form.cleaned_data['proposito'],
				fecha_evento = form.cleaned_data['fecha_evento']
			)
			return redirect('listar_eventos')
	else:
		form = EventoForm()
		return render(request, 'appong/Eventos/nuevo_evento.html', { 'form': form })
	

def eliminar_evento(request, id):
	evento = get_object_or_404(Evento, id_evento=id)
	evento.delete()
	return redirect('listar_eventos')


def modificar_evento(request, id):
	evento = get_object_or_404(Evento, id_evento=id)
	if request.method == 'POST':
		form = EventoForm(request.POST)
		if form.is_valid():
			evento.nombre_evento = form.cleaned_data['nombre_evento']
			evento.proposito = form.cleaned_data['proposito']
			evento.fecha_evento = form.cleaned_data['fecha_evento']
			evento.save()
			return redirect('listar_eventos')
	else:
		form = EventoForm(initial={
			'id_evento': evento.id_evento,
			'nombre_evento': evento.nombre_evento,
			'proposito': evento.proposito,
			'fecha_evento': evento.fecha_evento,
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
			Voluntario.objects.create(
				nombre = form.cleaned_data['nombre'],
				apellido = form.cleaned_data['apellido'],
				rol = form.cleaned_data['rol'],
				ci = form.cleaned_data['ci'],
				correo = form.cleaned_data['correo'],
				horas_acumuladas = form.cleaned_data['horas_acumuladas']
			)
			return redirect('listar_voluntarios')
	else:
		form = VoluntarioForm()
		return render(request, 'appong/Voluntarios/nuevo_voluntario.html', { 'form': form })
def eliminar_voluntario(request, id):
	voluntario = get_object_or_404(Voluntario, id_voluntario=id)
	voluntario.delete()
	return redirect('listar_voluntarios')
def modificar_voluntario(request, id):
	voluntario = get_object_or_404(Voluntario, id_voluntario=id)
	if request.method == 'POST':
		form = VoluntarioForm(request.POST)
		if form.is_valid():
			voluntario.nombre = form.cleaned_data['nombre']
			voluntario.apellido = form.cleaned_data['apellido']
			voluntario.rol = form.cleaned_data['rol']
			voluntario.ci = form.cleaned_data['ci']
			voluntario.correo = form.cleaned_data['correo']
			voluntario.horas_acumuladas = form.cleaned_data['horas_acumuladas']
			voluntario.save()
			return redirect('listar_voluntarios')
	else:
		form = VoluntarioForm(initial={
			'id_voluntario': voluntario.id_voluntario,
			'nombre': voluntario.nombre,
			'apellido': voluntario.apellido,
			'rol': voluntario.rol,
			'ci': voluntario.ci,
			'correo': voluntario.correo,
			'horas_acumuladas': voluntario.horas_acumuladas,
		})
		return render(request, 'appong/Voluntarios/actualizar_voluntario.html', { 'form': form })

#  CRUD Inscritos
def listar_inscritos(request):
	inscritos = Inscrito.objects.all()
	return render(request, 'appong/Inscritos/lista_inscritos.html', { 'inscritos': inscritos })

def crear_inscrito(request):
	if request.method == 'POST':
		form = InscritoForm(request.POST)
		if form.is_valid():
			Inscrito.objects.create(
				nombre = form.cleaned_data['nombre'],
				apellido = form.cleaned_data['apellido'],
				ci = form.cleaned_data['ci'],
				fecha_nacimiento = form.cleaned_data['fecha_nacimiento']
			)
			return redirect('listar_inscritos')
	else:
		form = InscritoForm()
		return render(request, 'appong/Inscritos/nuevo_inscrito.html', { 'form': form })
def eliminar_inscrito(request, id):
	inscrito = get_object_or_404(Inscrito, id_inscrito=id)
	inscrito.delete()
	return redirect('listar_inscritos')
def modificar_inscrito(request, id):
	inscrito = get_object_or_404(Inscrito, id_inscrito=id)
	if request.method == 'POST':
		form = InscritoForm(request.POST)
		if form.is_valid():
			inscrito.nombre = form.cleaned_data['nombre']
			inscrito.apellido = form.cleaned_data['apellido']
			inscrito.ci = form.cleaned_data['ci']
			inscrito.fecha_nacimiento = form.cleaned_data['fecha_nacimiento']
			inscrito.save()
			return redirect('listar_inscritos')
	else:
		form = InscritoForm(initial={
			'id_inscrito': inscrito.id_inscrito,
			'nombre': inscrito.nombre,
			'apellido': inscrito.apellido,
			'ci': inscrito.ci,
			'fecha_nacimiento': inscrito.fecha_nacimiento,
		})
		return render(request, 'appong/Inscritos/actualizar_inscrito.html', { 'form': form })

#  CRUD Asistencias
def listar_asistencias(request):
	asistencias = Asistencia.objects.all()
	return render(request, 'appong/Asistencias/lista_asistencias.html', { 'asistencias': asistencias })


def crear_asistencia(request):
	if request.method == 'POST':
		form = AsistenciaForm(request.POST)
		if form.is_valid():
			Asistencia.objects.create(
				evento = get_object_or_404(Evento, id_evento=form.cleaned_data['id_evento']),
				voluntario = get_object_or_404(Voluntario, id_voluntario=form.cleaned_data['id_voluntario']),
				hora_llegada = form.cleaned_data['hora_llegada'],
				hora_salida = form.cleaned_data['hora_salida']
			)
			return redirect('listar_asistencias')
	else:
		form = AsistenciaForm()
		return render(request, 'appong/Asistencias/nueva_asistencia.html', { 'form': form })

def eliminar_asistencia(request, id):
	asistencia = get_object_or_404(Asistencia, id_asistencia=id)
	asistencia.delete()
	return redirect('listar_asistencias')
def modificar_asistencia(request, id):
	asistencia = get_object_or_404(Asistencia, id_asistencia=id)
	if request.method == 'POST':
		form = AsistenciaForm(request.POST)
		if form.is_valid():
			asistencia.evento = get_object_or_404(Evento, id_evento=form.cleaned_data['id_evento'])
			asistencia.voluntario = get_object_or_404(Voluntario, id_voluntario=form.cleaned_data['id_voluntario'])
			asistencia.hora_llegada = form.cleaned_data['hora_llegada']
			asistencia.hora_salida = form.cleaned_data['hora_salida']
			asistencia.save()
			return redirect('listar_asistencias')
	else:
		form = AsistenciaForm(initial={
			'id_evento': asistencia.evento.id_evento,
			'id_voluntario': asistencia.voluntario.id_voluntario,
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
