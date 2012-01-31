from django.template import TemplateDoesNotExist
from django.shortcuts import render_to_response as r2r
from django.http import HttpResponse, Http404
from django.views.generic.simple import direct_to_template
import datetime

def hello(request):
    return HttpResponse('Hello world!')

def current_datetime(request):
    current_date = datetime.datetime.now()
    return r2r('current_datetime.html', locals())

def hours_ahead(request, offset):
    hour_offset = int(offset)
    next_time = datetime.datetime.now() + datetime.timedelta(hours=hour_offset)
    return r2r('hours_ahead.html', locals())

def about_pages(request):
    try:
        return direct_to_template(request, template="about/%s.html" % page)
    except TemplateDoesNotExist:
        raise Http404()

def show_color(request):
    if 'favorite_color' in request.COOKIES:
        return HttpResponse("Your favorite color is %s" % request.COOKIES['favorite_color'])
    else:
        return HttpResponse('You don\'t have a favorite color, you heathen.')

def set_color(request):
    if 'favorite_color' in request.GET:
        response = HttpResponse("Your favorite color is now %s" % request.COOKIES['favorite_color'])
        response.set_cookie('favorite_color', request.GET['favorite_color'])
        return response
    else:
        return HttpResponse('You didn\'t give a favorite color.')
