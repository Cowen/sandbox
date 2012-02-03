from django.conf.urls.defaults import patterns, include, url
from django.views.generic import list_detail
from django.views.generic.simple import direct_to_template
from stats.models import Team

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

team_info = {
    'queryset' : Team.objects.all(),
    'template_object_name' : 'team',
    # 'template_name' : 'teams.html',
}

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'nhl.views.home', name='home'),
    # url(r'^nhl/', include('nhl.foo.urls')),
    (r'^$', direct_to_template, { 'template' : 'index.html' }),
    (r'^teams/$', list_detail.object_list, { 'queryset': Team.objects.all() }),
    (r'^stats/$', include('stats.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
