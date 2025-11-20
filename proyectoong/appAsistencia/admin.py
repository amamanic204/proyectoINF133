from django.contrib import admin
from .models import Evento, Voluntario, Inscrito, Asistencia

# Register your models here.

admin.site.register(Evento)
admin.site.register(Voluntario)
admin.site.register(Inscrito)
admin.site.register(Asistencia)