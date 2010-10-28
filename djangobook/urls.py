from django.conf.urls.defaults import *
from djangobook.views import *
from djangobook.books import views

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^$', homepage),
    (r'^hello/$', hello),
    (r'^time/$', time),
    (r'^time/plus/(\d{1,3})/?$', hours_ahead),
    (r'^meta$', display_meta),
    (r'^search-form/$', views.search_form),
    (r'^search/$', views.search),
    # Example:
    # (r'^djangobook/', include('djangobook.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
)
