from django.contrib import admin
from django.urls import include, path
from . import views

urlpatterns = [
    path('', views.intro, name='intro'),
    path('eventos/', views.listar_eventos, name='eventos'),
    path('nuevo_evento/', views.crear_evento, name='nuevo_evento'),
    path('eliminar_evento/<int:id>/', views.eliminar_evento, name='eliminar_evento'),
    path('modificar_evento/<int:id>/', views.modificar_evento, name='modificar_evento'),
    # crud voluntarios
    path('voluntarios/', views.listar_voluntarios, name='voluntarios'),
    path('nuevo_voluntario/', views.crear_voluntario, name='nuevo_voluntario'),
    path('eliminar_voluntario/<int:id>/', views.eliminar_voluntario, name='eliminar_voluntario'),
    path('modificar_voluntario/<int:id>', views.modificar_voluntario, name='modificar_voluntario'),
    # crud inscripciones
    path('inscripciones/', views.listar_inscripciones, name='inscripciones'),
    path('nueva_inscripcion/', views.crear_inscripcion, name='nueva_inscripcion'),
    path('eliminar_inscripcion/<int:id>', views.eliminar_inscripcion, name='eliminar_inscripcion'),
    path('modificar_inscripcion/<int:id>', views.modificar_inscripcion, name='modificar_inscripcion'),
    # # crud asistencias
    path('asistencias/', views.listar_asistencias, name='asistencias'),
    path('nueva_asistencia/', views.crear_asistencia, name='nueva_asistencia'),
    path('eliminar_asistencia/<int:id>', views.eliminar_asistencia, name='eliminar_asistencia'),
    path('modificar_asistencia/<int:id>', views.modificar_asistencia, name='modificar_asistencia'),
    # # funcionalidades
    path('horas_acumuladas/<int:id>', views.horas_acumuladas, name='horas_acumuladas'),
    path('cambiar_rol/<int:id>/', views.cambiar_rol, name='cambiar_rol'),
    path('hoja_asistencia/<int:id>', views.hoja_asistencia_evento, name='hoja_asistencia_evento'),
    path('eventos_participados/<int:id>', views.eventos_participados, name='eventos_participados'),
]