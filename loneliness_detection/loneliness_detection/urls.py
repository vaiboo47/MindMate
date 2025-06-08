"""loneliness_detection URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
    
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
    
"""
from django.contrib import admin
from django.urls import path

from myapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.log),
    path('log_post', views.log_post),
    path('logout', views.logout),


    #############           admin
    path('adm_home', views.adm_home),
    path('adm_add_department', views.adm_add_department),
    path('adm_add_department_post', views.adm_add_department_post),
    path('adm_view_department', views.adm_view_department),
    path('adm_delete_department/<id>', views.adm_delete_department),
    path('adm_edit_department/<id>', views.adm_edit_department),
    path('adm_edit_department_post/<id>', views.adm_edit_department_post),
    path('adm_add_course', views.adm_add_course),
    path('adm_add_course_post', views.adm_add_course_post),
    path('adm_view_course', views.adm_view_course),
    path('adm_delete_course/<id>', views.adm_delete_course),
    path('adm_edit_course/<id>', views.adm_edit_course),
    path('adm_edit_course_post/<id>', views.adm_edit_course_post),
    path('adm_add_student', views.adm_add_student),
    path('adm_add_student_post', views.adm_add_student_post),
    path('adm_view_student', views.adm_view_student),
    path('adm_delete_student/<id>', views.adm_delete_student),
    path('adm_edit_student/<id>', views.adm_edit_student),
    path('adm_edit_student_post/<id>', views.adm_edit_student_post),
    path('adm_add_staff', views.adm_add_staff),
    path('adm_add_staff_post', views.adm_add_staff_post),
    path('adm_view_staff', views.adm_view_staff),
    path('adm_delete_staff/<id>', views.adm_delete_staff),
    path('adm_edit_staff/<id>', views.adm_edit_staff),
    path('adm_edit_staff_post/<id>', views.adm_edit_staff_post),
    path('adm_add_team', views.adm_add_team),
    path('adm_add_team_post', views.adm_add_team_post),
    path('adm_view_team', views.adm_view_team),
    path('adm_delete_team/<id>', views.adm_delete_team),
    path('adm_edit_team/<id>', views.adm_edit_team),
    path('adm_edit_team_post/<id>', views.adm_edit_team_post),
    path('adm_add_tutor', views.adm_add_tutor),
    path('adm_add_tutor_post', views.adm_add_tutor_post),
    path('adm_view_feedback', views.adm_view_feedback),
    path('adm_view_complaint', views.adm_view_complaint),
    path('adm_send_reply/<id>', views.adm_send_reply),
    path('adm_send_reply_post/<id>', views.adm_send_reply_post),



    ####################        STAFF
    path('staff_home', views.staff_home),
    path('staff_view_profile', views.staff_view_profile),
    path('staff_send_feedback', views.staff_send_feedback),
    path('staff_send_feedback_post', views.staff_send_feedback_post),
    path('staff_view_allocated_batch', views.staff_view_allocated_batch),
    path('staff_view_students/<cid>/<sem>', views.staff_view_students),
    path('staff_view_depress_students/<cid>/<sem>', views.staff_view_depress_students),
    path('chatt/<u>', views.chatt),
    path('chatsnd/<u>', views.chatsnd),
    path('chatrply', views.chatrply),
    path('chatt_chatbot/<u>', views.chatt_chatbot),
    path('chatsnd_chatbot/<u>', views.chatt_chatbot),
    path('chatrply_chatbot', views.chatrply_chatbot),
    path('staff_view_councelling_team/<sid>', views.staff_view_councelling_team),
    path('staff_make_booking/<sid>/<cid>', views.staff_make_booking),
    path('staff_add_motivation', views.staff_add_motivation),
    path('staff_add_motivation_post', views.staff_add_motivation_post),
    path('staff_view_motivation', views.staff_view_motivation),
    path('staff_delete_motivation/<id>', views.staff_delete_motivation),
    path('staff_view_booking', views.staff_view_booking),



    ####################        COUNSELLING TEAM
    path('team_home', views.team_home),
    path('team_view_profile', views.team_view_profile),
    path('team_view_bookings', views.team_view_bookings),
    path('team_view_upcoming_bookings', views.team_view_upcoming_bookings),
    path('team_update_attendance/<id>/<stat>', views.team_update_attendance),
    path('team_view_previous_bookings', views.team_view_previous_bookings),
    path('team_add_progress/<id>', views.team_add_progress),
    path('team_add_progress_post/<id>', views.team_add_progress_post),
    path('team_update_booking/<id>', views.team_update_booking),
    path('team_update_booking_post/<id>', views.team_update_booking_post),
    path('team_add_schedule', views.team_add_schedule),
    path('team_add_schedule_post', views.team_add_schedule_post),
    path('team_view_schedules', views.team_view_schedules),
    path('team_delete_schedule/<id>', views.team_delete_schedule),






    ##########          android
    path('stud_login', views.stud_login),
    path('stud_profile', views.stud_profile),
    path('stud_view_diary', views.stud_view_diary),
    path('stud_del_diary', views.stud_del_diary),
    path('stud_add_diary', views.stud_add_diary),
    path('stud_send_complaint', views.stud_send_complaint),
    path('stud_view_reply', views.stud_view_reply),
    path('stud_delete_comp', views.stud_delete_comp),
    path('stud_view_motivation', views.stud_view_motivation),
    path('stud_view_booking', views.stud_view_booking),
    path('stud_view_schedule', views.stud_view_schedule),
    path('add_chat', views.add_chat),
    path('view_chat', views.view_chat),
    path('and_chatbot_send', views.and_chatbot_send),
    path('and_chatbot_view', views.and_chatbot_view),
    path('and_insert_score', views.and_insert_score),
    path('stud_emotion', views.stud_emotion),
    path('staff_view_questionnairescore/<id>', views.staff_view_questionnairescore),

]

