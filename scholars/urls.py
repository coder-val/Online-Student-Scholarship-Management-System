from django.urls import path
from .views import error, registerPage, loginPage, logoutUser, user_file_confirm_delete, user_file_update, userPage, user_profile, dashboard, list, filelist, file_upload, file_upload_check, file_update, file_delete, file_delete_check, ScholarDetailView, ScholarUpdateView, ScholarDeleteView, UserUpdateView
from django.contrib.auth.decorators import login_required

urlpatterns = [
    # path('register/', registerPage, name='register'),
    path('login/', loginPage, name='login'),
    path('logout/', logoutUser, name='logout'),
    path('', dashboard, name='dashboard'),
    
    path('scholar_list/', list, name='scholar_list'),
    path('scholar_filelist/', filelist, name='scholar_filelist'),

    # path('scholar_create/', login_required(ScholarCreateView.as_view(), login_url='login'), name='scholar_create'),
    path('scholar_create/', registerPage, name='scholar_create'),
    path('scholar_detail/<int:pk>/', login_required(ScholarDetailView.as_view(), login_url='login'),  name='scholar_detail'),
    path('scholar_update/<int:pk>/', login_required(ScholarUpdateView.as_view(), login_url='login'), name='scholar_update'),
    path('scholar_delete/<int:pk>/', login_required(ScholarDeleteView.as_view(), login_url='login'), name='scholar_delete'),

    path('scholar_file_upload/<int:pk>/', file_upload, name='file_upload'),
    path('scholar_file_upload_check/<int:pk>/', file_upload_check, name='file_upload_check'),
    path('scholar_file_update/<int:pk>/', file_update, name='file_update'),
    path('scholar_file_delete/<int:pk>/', file_delete, name='file_delete'),
    path('scholar_file_confirm_delete/<int:pk>/', file_delete_check, name='file_delete_check'),

    path('error/', error, name='error404'),

    path('user/', userPage, name='user_page'),
    path('user/profile/', user_profile, name='user_profile'),
    path('user/profile_update/<int:pk>/', login_required(UserUpdateView.as_view(), login_url='login'), name='user_profile_update'),
    path("user/file_manager/<int:pk>/", user_file_update, name="user_file_update"),
    path("user/file_confirm_delete/<int:pk>/", user_file_confirm_delete, name="user_file_confirm_delete"),
]

