from django.db.models import Q
from django.shortcuts import render_to_response as r2r
from django.http import HttpResponseRedirect
from django.core.mail import send_mail
from models import Book, Publisher
from forms import ContactForm

def publishers(request):
    publishers = Publisher.objects.all()
    return r2r('publishers.html', locals())

def search(request):
    query = request.GET.get('q','')
    if query:
        qset = (
            Q(title__icontains=query) |
            Q(authors__first_name__icontains=query) |
            Q(authors__last_name__icontains=query)
        )
        results = Book.objects.filter(qset).distinct()
    else:
        results = []
    return r2r('search.html', {
        'results': results,
        'query': query
    })

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST, initial={'sender': 'user@example.com'})
        if form.is_valid():
            topic = form.clean_data['topic']
            message = form.clean_data['message']
            sender = form.clean_data.get('sender', 'noreply@example.com')
            send_mail('Feedback from your site, topic: %s' % topic, message, sender, ['administrator@example.com'])
            return HttpResponseRedirect('/contact/thanks/')
    else:
        form = ContactForm(initial={'sender': 'user@example.com'})
    return r2r('contact.html', {'form': form})
