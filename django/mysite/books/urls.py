from django.conf.urls.defaults import *
from django.views.generic import list_detail
from books.views import *
from books.models import Author

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

author_info = {
    'queryset' : Author.objects.all(),
}

urlpatterns = patterns('books.views',
    (r'^publishers/$', 'publishers'),
    (r'^search/$', 'search'),
    (r'^contact/$', 'contact'),
    (r'^authors/$', list_detail.object_list, author_info),
    # Example:
    # (r'^mysite/', include('mysite.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # (r'^admin/', include(admin.site.urls)),
)
