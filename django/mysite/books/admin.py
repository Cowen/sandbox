from books.models import *
from django.contrib import admin

admin.site.register(Book)

class PublisherAdmin(admin.ModelAdmin):
    fields = ['name', 'website']

admin.site.register(Publisher, PublisherAdmin)
admin.site.register(Author)
