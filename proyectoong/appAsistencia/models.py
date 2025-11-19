from django.db import models

# Create your models here.
class Evento(models.Model):
	id_evento = models.AutoField(primary_key=True)
	nombre_evento = models.CharField(max_length=200)
	proposito = models.CharField(max_length=1000)
	fecha_evento = models.DateField()
	class Meta:
		managed = False
		db_table = 'eventos'
class Voluntario(models.Model):
	id_voluntario = models.AutoField(primary_key=True)
	nombre = models.CharField(max_length=100)
	apellido = models.CharField(max_length=100)
	rol = models.CharField(max_length=100)
	ci = models.CharField(max_length=100)
	correo = models.EmailField(max_length=150)
	horas_acumuladas = models.IntegerField()
	class Meta:
		managed = False
		db_table = 'voluntarios'
class Inscrito(models.Model):
	id_inscrito = models.AutoField(primary_key=True)
	nombre = models.CharField(max_length=100)
	apellido = models.CharField(max_length=100)
	ci = models.CharField(max_length=20)
	fecha_nacimiento = models.DateField()
	class Meta:
		managed = False
		db_table = 'inscritos'
class Asistencia(models.Model):
	id_asistencia = models.AutoField(primary_key=True)
	evento = models.ForeignKey(
		Evento,
		on_delete = models.CASCADE,
		db_column = 'id_evento'
	)
	voluntario = models.ForeignKey(
		Voluntario,
		on_delete = models.CASCADE,
		db_column = 'id_voluntario'
	)
	inscrito = models.ForeignKey(
		Inscrito,
		on_delete = models.CASCADE,
		db_column = 'id_inscrito',
	)
	hora_llegada = models.DateTimeField()
	hora_salida = models.DateTimeField()
	class Meta:
		managed = False
		db_table = 'asistencias'