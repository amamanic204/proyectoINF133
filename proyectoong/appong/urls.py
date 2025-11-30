from django.contrib import admin
from django.urls import include, path
from . import views

urlpatterns = [
    path('', views.principal, name='principal'),
    path('eventos/', views.listar_eventos, name='listar_eventos'),
    path('nuevo_evento/', views.crear_evento, name='crear_evento'),
    path('eliminar_evento/<int:id>/', views.eliminar_evento, name='eliminar_evento'),
    path('modificar_evento/<int:id>/', views.modificar_evento, name='modificar_evento'),
    # crud voluntarios
    path('voluntarios/', views.listar_voluntarios, name='listar_voluntarios'),
    path('nuevo_voluntario/', views.crear_voluntario, name='crear_voluntario'),
    path('eliminar_voluntario/<int:id>/', views.eliminar_voluntario, name='eliminar_voluntario'),
    path('modificar_voluntario/<int:id>', views.modificar_voluntario, name='modificar_voluntario'),
    # crud inscripciones
    path('inscripciones/', views.listar_inscripciones, name='listar_inscripciones'),
    path('nuevo_inscripcion/', views.crear_inscripcion, name='crear_inscripcion'),
    path('eliminar_inscripcion/<int:id>', views.eliminar_inscripcion, name='eliminar_inscripcion'),
    path('modificar_inscripcion/<int:id>', views.modificar_inscripcion, name='modificar_inscripcion'),
    # # crud asistencias
    path('asistencias/', views.listar_asistencias, name='listar_asistencias'),
    path('nueva_asistencia/', views.crear_asistencia, name='crear_asistencia'),
    path('eliminar_asistencia/<int:id>', views.eliminar_asistencia, name='eliminar_asistencia'),
    path('modificar_asistencia/<int:id>', views.modificar_asistencia, name='modificar_asistencia'),
    # # funcionalidades
    # path('horas_acumuladas/', views.horas_acumuladas, name='horas_acumuladas'),
    # path('verhoras/<int:id_voluntario>/', views.ver_horas_voluntario, name = 'ver_horas_voluntario'),
    # path('cambiar_rol/<int:id_voluntario>/', views.cambiar_rol, name='cambiar_rol'),
]