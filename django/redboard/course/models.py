from django.db import models

# Create your models here.
CONTENT_TYPES = (
    ('ASSN','Assignment'),
    ('EXAM','Exam'),
    ('NOTE','Notes'),
    ('EXTRA','Extra'),
    ('ANNCE', 'Announcement'),
)

class School(models.Model):
    name = models.CharField(max_length=255)
    register_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Admin:
        pass

    class Meta:
        ordering = [ 'name' ]

class User(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=50)
    email = models.EmailField()
    headshot = models.ImageField(upload_to='/tmp', blank=True, null=True)
    school = models.ForeignKey(School, blank=True, null=True)
    register_date = models.DateTimeField(auto_now_add=True)
    acct_admin = models.BooleanField()

    def __str__(self):
        return self.email

    class Admin:
        pass

    class Meta:
        ordering = [ 'email' ]


class Course(models.Model):
    teachers = models.ManyToManyField(User, related_name='teachers')
    students = models.ManyToManyField(User, related_name='students')
    school = models.ForeignKey(School, blank=True, null=True)
    title = models.CharField(max_length=255)
    start_date = models.DateField()
    end_date = models.DateField()

    def __str__(self):
        return self.title + ':' + str(self.start_date)

    class Admin:
        pass

class Lecture(models.Model):
    course = models.ManyToManyField(Course)
    authors = models.ManyToManyField(User)
    pub_date = models.DateField(auto_now_add=True)
    title = models.CharField(max_length=255)
    video = models.FileField(upload_to='videos')
    audio = models.FileField(upload_to='audio', blank=True, null=True)

    def __str__(self):
        return self.title

    class Meta:
        ordering = [ 'title', 'pub_date' ]

class LectureComment(models.Model):
    commenter = models.ForeignKey(User)
    timestamp = models.DateTimeField(auto_now_add=True)
    lecture = models.ForeignKey(Lecture)
    body = models.TextField()

    def __str__(self):
        return self.commenter + ': ' + self.body[:50]

    class Admin:
        pass

    class Meta:
        ordering = [ 'timestamp' ]


class CourseContent(models.Model):
    course = models.ForeignKey(Course)
    content_type = models.CharField(max_length=5,choices=CONTENT_TYPES)
    title = models.CharField(max_length=255)
    description = models.TextField()
    pub_date = models.DateTimeField(auto_now_add=True)
    due_date = models.DateField(blank=True, null=True)
    attachment = models.FileField(upload_to='attachments', blank=True, null=True)

    def __str__(self):
        return self.course + ' : ' + self.title

    class Admin:
        pass

    class Meta:
        ordering = [ 'pub_date' ]

