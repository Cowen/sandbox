from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
from mysite.views import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^hello/$', hello),
    (r'^time/$', current_datetime),
    (r'^time/plus/(\d{1,2})/$', hours_ahead),
    (r'^books/', include('books.urls')),
    (r'^about/$', direct_to_template, { 'template': 'about.html' }),
    ('^about/(w+)/$', about_pages),
    # Example:
    # (r'^mysite/', include('mysite.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
)
