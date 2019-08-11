from django.urls import path
from .views import test

urlpatterns = [
	path('', test, name='test'),
	path('login/', test, name='login'),
	path('signup/', test, name='signup'),
	path('question/<int:question_id>/', test, name='question'),
	path('ask/', test, name='ask'),
	path('popular/', test, name='popular'),
	path('new/', test, name='new'),
]
