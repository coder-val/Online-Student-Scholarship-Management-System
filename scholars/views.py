from dataclasses import fields
from django.shortcuts import render, redirect
from .models import Scholar
from django.views.generic import CreateView, DetailView, UpdateView, DeleteView
from django.contrib.auth.models import Group, User
from django.contrib.messages.views import SuccessMessageMixin
from .forms import CreateUserForm
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse_lazy
from django.contrib import messages
import os
from .decorators import allowed_users, unauthenticated_user, admin_only
from django.contrib.auth.decorators import login_required

# Create your views here.

# @unauthenticated_user
# def registerPage(request):
#     form = CreateUserForm()
#     if request.method == 'POST':
#         form = CreateUserForm(request.POST)
#         if form.is_valid():
#             user = form.save()
#             username = form.cleaned_data.get('username')
#             first_name = form.cleaned_data.get('first_name')
#             last_name = form.cleaned_data.get('last_name')

#             group = Group.objects.get(name='scholar')
#             user.groups.add(group)
#             Scholar.objects.create(student_ID=user, first_name=first_name, last_name = last_name)

#             messages.success(request, 'Account was created for ' + username)
#             return redirect('login')
#     context = {'form': form}
#     return render(request, 'scholars/register.html', context)

@unauthenticated_user
def loginPage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('dashboard')
        else:
            messages.warning(request, 'username or password is incorrect.')

    context = {}
    return render(request, 'scholars/login.html', context)

def logoutUser(request):
    logout(request)
    return redirect('login')

@login_required(login_url='login')
@admin_only
def dashboard(request):
    scholar_count = Scholar.objects.all().count()
    program_tdp = Scholar.objects.filter(scholarship_program='CHED-TDP').count()
    program_tes = Scholar.objects.filter(scholarship_program='CHED-TES').count()
    complete_remarks = Scholar.objects.filter(remarks='OK').count()
    # remarks = round((complete_remarks/scholar_count)*100)
    try:
        remarks = round((complete_remarks/scholar_count)*100)
    except ZeroDivisionError:
        remarks = 0
    pending_remarks = Scholar.objects.filter(remarks='PENDING').count()
    new_remarks = Scholar.objects.filter(remarks='NEW').count()

    context = {
        'scholar_count': scholar_count,
        'program_tdp': program_tdp,
        'program_tes': program_tes,
        'complete_remarks': complete_remarks,
        'remarks': remarks,
        'pending_remarks': pending_remarks,
        'new_remarks': new_remarks,
    }
    return render(request, 'scholars/dashboard.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['scholar'])
def userPage(request):
    # scholar_infos = Scholar.objects.filter(student_ID=request.user.username)
    #scholar_infos = Scholar.objects.filter(student_ID=request.user.scholar.student_ID)
    scholar_count = Scholar.objects.all().count()
    program_tdp = Scholar.objects.filter(scholarship_program='CHED-TDP').count()
    program_tes = Scholar.objects.filter(scholarship_program='CHED-TES').count()
    context = {
        'scholar_count': scholar_count,
        'program_tdp': program_tdp,
        'program_tes': program_tes,
    }
    return render(request, 'scholars/user.html', context)

def error(request):
    context = {}
    return render(request, 'scholars/404.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def list(request):
    scholars = Scholar.objects.all()
    context = {
        'scholars': scholars
    }
    return render(request, 'scholars/scholar_list.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['scholar'])
def user_profile(request):
    return render(request, 'scholars/user_profile.html')

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def filelist(request):
    scholars = Scholar.objects.all()
    context = {
        'scholars': scholars
    }
    return render(request, 'scholars/scholar_filelist.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def file_upload(request, pk):
    zipFile = Scholar.objects.get(id=pk)
    context = {
        'zipFile':zipFile
    }
    return render(request, 'scholars/scholar_file_upload.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def file_upload_check(request, pk):
    zipFile = Scholar.objects.get(id=pk)
    zipFile.remarks = 'PENDING'
    if request.method == "POST":
        uploaded_file = request.FILES['zip_file']
        zipFile.save(update_fields=['remarks'])
        zipFile.zip_file.save(uploaded_file.name, uploaded_file)
        
        messages.success(request, "Files uploaded successfully!")
        return redirect('scholar_filelist')
    context = {'zipFile':zipFile}
    return render(request, 'scholars/scholar_file_upload.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def file_update(request, pk):
    zipFile = Scholar.objects.get(id=pk)
    if request.method == "POST":
        if len(request.FILES) != 0:
            if len(zipFile.zip_file) > 0:
                os.remove(zipFile.zip_file.path)
            zipFile.zip_file = request.FILES['zip_file']
        zipFile.save()
        messages.success(request, "Files updated successfully!")
        return redirect('scholar_filelist')
    context = {'zipFile':zipFile}
    return render(request, 'scholars/scholar_file_update.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def file_delete(request, pk):
    zipFile = Scholar.objects.get(id=pk)
    context = {
        'zipFile':zipFile
    }
    return render(request, 'scholars/scholar_file_confirm_delete.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def file_delete_check(request, pk):
    zipFile = Scholar.objects.get(pk=pk)
    zipFile.remarks = 'NEW'
    if request.method == 'POST':
        zipFile.zip_file.delete()
        zipFile.save(update_fields=['remarks'])
        messages.success(request, "Files deleted successfully!")
        return redirect('scholar_filelist')
    context = {'zipFile':zipFile}
    return render(request, 'scholars/scholar_file_confirm_delete.html', context)


# class ScholarCreateView(SuccessMessageMixin, CreateView):
    # model = Scholar
    # fields = [
    #     'student_ID',
    #     'last_name',
    #     'first_name',
    #     'middle_name',
    #     'contact_number',
    #     'college',
    #     'college_year',
    #     'scholarship_program',
    #     # 'zip_file',
    #     # 'remarks',
    # ]
    # model = User
    # fields = [
    #     'username', 
    #     'first_name', 
    #     'last_name', 
    #     'email', 
    #     'password',
    # ]
    # template_name = 'scholars/scholar_create.html'
    # success_url = reverse_lazy('scholar_list')
    # success_message = "New scholar added!"   

    # def form_validate(self, form):
    #     return super().form_valid(form)

@login_required(login_url='login')
@allowed_users(allowed_roles=['admin'])
def registerPage(request):
    form = CreateUserForm()
    password = request.POST.get('username')
    form.password1 = password
    form.password2 = password
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        password = request.POST.get('username')
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')

            group = Group.objects.get(name='scholar')
            user.groups.add(group)
            userr = User.objects.get(username=user)
            userr.set_password(username)
            Scholar.objects.create(student_ID=user, first_name=first_name, last_name = last_name)
            messages.success(request, 'Account was created for ' + username)
            return redirect('scholar_create')
    context = {'form': form}
    return render(request, 'scholars/scholar_create.html', context)

class ScholarDetailView(DetailView):
    model = Scholar
    context_object_name = 'scholars'
    template_name = 'scholars/scholar_detail.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

class ScholarUpdateView(SuccessMessageMixin, UpdateView):
    model = Scholar
    fields = [
        'student_ID',
        'last_name',
        'first_name',
        'middle_name',
        'contact_number',
        'college',
        'college_year',
        'scholarship_program',
        'remarks',
    ]
    success_url = reverse_lazy('scholar_list')
    template_name = 'scholars/scholar_update.html'
    success_message = "Scholar updated successfully!"

    def form_validate(self, form):
        return super().form_valid(form)

class UserUpdateView(SuccessMessageMixin, UpdateView):
    model = Scholar
    fields = [
        # 'student_ID',
        'last_name',
        'first_name',
        'middle_name',
        'contact_number',
        'college',
        'college_year',
        'scholarship_program',
        # 'remarks',
    ]
    success_url = reverse_lazy('user_page')
    template_name = 'scholars/user_profile_update.html'
    success_message = "Profile updated successfully!"

    def form_validate(self, form):
        return super().form_valid(form)

class ScholarDeleteView(SuccessMessageMixin, DeleteView):
    model = User
    success_url = reverse_lazy('scholar_list')
    template_name = 'scholars/scholar_confirm_delete.html'
    success_message = "Scholar deleted successfully!"

    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

@login_required(login_url='login')
@allowed_users(allowed_roles=['scholar'])
def user_file_update(request, pk):
    zipFile = Scholar.objects.get(id=pk)
    if request.method == "POST":
        if len(request.FILES) != 0:
            if (zipFile.zip_file):
                if len(zipFile.zip_file) > 0:
                    os.remove(zipFile.zip_file.path)
            zipFile.zip_file = request.FILES['zip_file']
            zipFile.remarks = 'PENDING'
            zipFile.save(update_fields=['remarks'])
            zipFile.save()
        messages.success(request, "File uploaded successfully!")
        return redirect('user_page')
    context = {'zipFile':zipFile}
    return render(request, 'scholars/user_file_update.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['scholar'])
def user_file_delete(request, pk):
    zipFile = Scholar.objects.get(id=pk)
    context = {
        'zipFile':zipFile
    }
    return render(request, 'scholars/user_file_confirm_delete.html', context)

@login_required(login_url='login')
@allowed_users(allowed_roles=['scholar'])
def user_file_confirm_delete(request, pk):
    zipFile = Scholar.objects.get(pk=pk)
    zipFile.remarks = 'NEW'
    if request.method == 'POST':
        zipFile.zip_file.delete()
        zipFile.save(update_fields=['remarks'])
        messages.success(request, "Files deleted successfully!")
        return redirect('user_page')
    context = {'zipFile':zipFile}
    return render(request, 'scholars/user_file_confirm_delete.html', context)