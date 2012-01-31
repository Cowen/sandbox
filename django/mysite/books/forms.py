from django import forms
from models import Publisher

TOPIC_CHOICES = (
    ('general', 'General enquiry'),
    ('bug', 'Bug report'),
    ('suggestion', 'Suggestion'),
)

class ContactForm(forms.Form):
    topic = forms.ChoiceField(choices = TOPIC_CHOICES)
    message = forms.CharField(widget=forms.Textarea(), initial='Write your feedback here')
    sender = forms.EmailField(required=False) 

# PublisherForm = form_for_model(Publisher)
