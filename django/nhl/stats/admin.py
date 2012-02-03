from models import *
from django.contrib import admin

admin.site.register(Player)
admin.site.register(PlayerGame)
admin.site.register(GameSummary)

class TeamAdmin(admin.ModelAdmin):
    fields = ['name', 'full_name']

admin.site.register(Team, TeamAdmin)
