from django.http import HttpResponse, Http404
from django.template.loader import get_template
from django.template import Context
from django.shortcuts import render_to_response

import datetime

def hello(request):
    return HttpResponse("Hello world!")

def time(request):
    now = datetime.datetime.now()
    # Long way:
    #   t = get_template('time.html')
    #   html = t.render(Context({ 'now' : now }))
    #   return HttpResponse(html)
    # Short way:
    #   return render_to_response('time.html', {'now' : now})
    # Shorter way:
    return render_to_response('time.html', locals())


def hours_ahead(request, offset):
    try:
        offset = int(offset)
    except:
        raise Http404()
    dt = datetime.datetime.now() + datetime.timedelta(hours=offset)
    html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)
    return HttpResponse(html)

def homepage(request):
    return HttpResponse("Homepage!")

def display_meta(request):
    values = request.META.values()
    values.sort()
    html = []
    for k, v in values:
        html.append('<tr><td>%s</td><td>%s</td></tr>' % (k, v))
    return HttpResponse('<table>%s</table>' % '\n'.join(html))

