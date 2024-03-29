from django.db import models
from django.conf import settings

class QuestionManager(models.Manager):
	def new(self):
		return self.order_by('-added_at')
		
	def popular(self):
		return self.order_by('-rating')
		

class Question(models.Model):
	title = models.CharField(max_length=255)
	text = models.TextField()
	added_at = models.DateTimeField(auto_now_add=True)
	rating = models.IntegerField(default=0)
	author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
	likes = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name='likes_set')
	
	objects = QuestionManager()
	
	def __str__(self):
		return self.title
		

class Answer(models.Model):
	text = models.TextField()
	added_at = models.DateTimeField(auto_now_add=True)
	question = models.ForeignKey(Question, on_delete=models.CASCADE)
	author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
