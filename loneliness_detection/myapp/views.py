import base64
import datetime
import random

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

from myapp.chatbotmain import get_response
# from myapp.emotion import predict_emo
from .models import *
import ssl
print(ssl.OPENSSL_VERSION)
# from deepface import DeepFace
# Create your views here.
static_path=r"D:\project\loneliness_detection\myapp\static\\"

def log(request):
    return render(request, "index.html")
    # return render(request, "login.html")

def log_post(request):
    usr=request.POST['t1']
    psw=request.POST['t2']
    res=login.objects.filter(username=usr, password=psw)
    if res.exists():
        res=res[0]
        request.session['lid']=res.id
        if res.usertype == "admin":
            return HttpResponse("<script>alert('Welcome admin');window.location='/adm_home';</script>")
        elif res.usertype == "staff":
            res2 = tutor.objects.filter(STAFF__LOGIN_id=request.session['lid'])
            if res2.exists():
                request.session['tid']=res2[0].id
            else:
                request.session['tid']=""
            return HttpResponse("<script>alert('Welcome staff');window.location='/staff_home';</script>")
        elif res.usertype == "team":
            return HttpResponse("<script>alert('Welcome counselling staff');window.location='/team_home';</script>")
        # elif res.usertype == "student":
        #     return HttpResponse("<script>alert('Welcome student');window.location='/student_home';</script>")
        else:
            return HttpResponse("<script>alert('Unauthorised user');window.location='/';</script>")
    else:
        return HttpResponse("<script>alert('Invalid details');window.location='/';</script>")

def adm_home(request):
    request.session['heading'] = "ADMIN HOME"
    return render(request, "admin/index.html")
    # return render(request, "admin/home.html")

def adm_add_department(request):
    request.session['heading'] = "ADD DEPARTMENT"
    return render(request, "admin/add_department.html")

def adm_add_department_post(request):
    dname=request.POST['t1']
    res=department.objects.filter(dep_name=dname)
    if res.exists():
        return HttpResponse("<script>alert('Department already added');window.location='/adm_add_department#abc';</script>")
    else:
        obj=department()
        obj.dep_name=dname
        obj.save()
        return HttpResponse("<script>alert('Department added successfully');window.location='/adm_add_department#abc';</script>")


def adm_view_department(request):
    request.session['heading'] = "VIEW DEPARTMENT"
    res=department.objects.all()
    return render(request, "admin/view_department.html", {'data':res})

def adm_delete_department(request, id):
    department.objects.filter(id=id).delete()
    return redirect('/adm_view_department#abc')

def adm_edit_department(request, id):
    request.session['heading'] = "EDIT DEPARTMENT"
    res=department.objects.get(id=id)
    return render(request, 'admin/edit_department.html', {'data':res})

def adm_edit_department_post(request, id):
    dname=request.POST['t1']
    department.objects.filter(id=id).update(dep_name=dname)
    return HttpResponse("<script>alert('Updated successfully');window.location='/adm_view_department#abc';</script>")

def adm_add_course(request):
    request.session['heading'] = "ADD COURSE"
    res=department.objects.all()
    return render(request, "admin/add_course.html", {'data':res})

def adm_add_course_post(request):
    crs_name=request.POST['t1']
    dep=request.POST['select']
    res=course.objects.filter(crs_name=crs_name)
    if res.exists():
        return HttpResponse("<script>alert('Course already added');window.location='/adm_add_course#abc';</script>")
    else:
        obj=course()
        obj.crs_name=crs_name
        obj.DEPARTMENT_id=dep
        obj.save()
        return HttpResponse("<script>alert('Course added successfully');window.location='/adm_add_course#abc';</script>")

def adm_view_course(request):
    request.session['heading'] = "VIEW COURSE"
    res=course.objects.all()
    return render(request, "admin/view_course.html", {'data':res})

def adm_delete_course(request, id):
    course.objects.filter(id=id).delete()
    return redirect('/adm_view_course#abc')

def adm_edit_course(request, id):
    request.session['heading'] = "EDIT COURSE"
    res=course.objects.get(id=id)
    res2=department.objects.all()
    return render(request, 'admin/edit_course.html', {'data':res, 'data2':res2})

def adm_edit_course_post(request, id):
    crs_name=request.POST['t1']
    dep=request.POST['select']
    course.objects.filter(id=id).update(crs_name=crs_name, DEPARTMENT=department.objects.get(id=dep))
    return HttpResponse("<script>alert('Updated successfully');window.location='/adm_view_course#abc';</script>")

def adm_add_student(request):
    request.session['heading'] = "ADD STUDENT"
    res=course.objects.all()
    return render(request, "admin/add_student.html", {'data':res})

def adm_add_student_post(request):
    stud_name=request.POST['t1']
    email=request.POST['t2']
    phone=request.POST['t3']
    house=request.POST['t4']
    place=request.POST['t5']
    post=request.POST['t6']
    pin=request.POST['t7']
    password=random.randint(1000, 9999)
    crs=request.POST['select']
    sem=request.POST['select2']

    obj=login()
    obj.username=email
    obj.password=password
    obj.usertype="student"
    obj.save()

    obj2=student()
    obj2.name=stud_name
    obj2.email=email
    obj2.phone_number=phone
    obj2.house_name=house
    obj2.place=place
    obj2.post=post
    obj2.pin=pin
    obj2.sem=sem
    obj2.COURSE_id=crs
    obj2.LOGIN=obj
    obj2.save()
    return HttpResponse("<script>alert('Added');window.location='/adm_add_student#abc';</script>")

def adm_view_student(request):
    request.session['heading'] = "VIEW STUDENT"
    res=student.objects.all()
    return render(request, "admin/view_student.html", {'data':res})

def adm_delete_student(request, id):
    login.objects.filter(id=id).delete()
    return redirect("/adm_view_student#abc")

def adm_edit_student(request, id):
    request.session['heading'] = "EDIT STUDENT"
    res=student.objects.get(id=id)
    return render(request, "admin/edit_student.html", {'data':res})

def adm_edit_student_post(request, id):
    stud_name = request.POST['t1']
    email = request.POST['t2']
    phone = request.POST['t3']
    house = request.POST['t4']
    place = request.POST['t5']
    post = request.POST['t6']
    pin = request.POST['t7']
    sem = request.POST['select2']

    obj2 = student.objects.get(id=id)
    obj2.name = stud_name
    obj2.email = email
    obj2.phone_number = phone
    obj2.house_name = house
    obj2.place = place
    obj2.post = post
    obj2.pin = pin
    obj2.sem = sem
    obj2.save()
    return HttpResponse("<script>alert('Updated');window.location='/adm_view_student#abc';</script>")


def adm_add_staff(request):
    request.session['heading'] = "ADD STAFF"
    res=department.objects.all()
    return render(request, "admin/add_staff.html", {'data':res})

def adm_add_staff_post(request):
    staff_name=request.POST['t1']
    email=request.POST['t2']
    phone=request.POST['t3']
    qual=request.POST['t4']
    exp=request.POST['t5']
    password=random.randint(1000, 9999)
    dep=request.POST['select']

    obj=login()
    obj.username=email
    obj.password=password
    obj.usertype="staff"
    obj.save()

    obj2=staff()
    obj2.name=staff_name
    obj2.email=email
    obj2.phone_number=phone
    obj2.qualification=qual
    obj2.experience=exp
    obj2.DEPARTMENT_id=dep
    obj2.LOGIN=obj
    obj2.save()
    return HttpResponse("<script>alert('Added');window.location='/adm_add_staff#abc';</script>")

def adm_view_staff(request):
    request.session['heading'] = "VIEW STAFF"
    res=staff.objects.all()
    return render(request, "admin/view_staff.html", {'data':res})

def adm_delete_staff(request, id):
    login.objects.filter(id=id).delete()
    return redirect("/adm_view_staff#abc")

def adm_edit_staff(request, id):
    request.session['heading'] = "EDIT STAFF"
    res=staff.objects.get(id=id)
    return render(request, "admin/edit_staff.html", {'data':res})

def adm_edit_staff_post(request, id):
    staff_name = request.POST['t1']
    email = request.POST['t2']
    phone = request.POST['t3']
    qual = request.POST['t4']
    exp = request.POST['t5']

    obj2 = staff.objects.get(id=id)
    obj2.name = staff_name
    obj2.email = email
    obj2.phone_number = phone
    obj2.qualification = qual
    obj2.experience = exp
    obj2.save()
    return HttpResponse("<script>alert('Updated');window.location='/adm_view_staff#abc';</script>")


def adm_add_team(request):
    request.session['heading'] = "ADD TEAM"
    return render(request, "admin/add_counselling_team.html")

def adm_add_team_post(request):
    staff_name=request.POST['t1']
    email=request.POST['t2']
    phone=request.POST['t3']
    password=random.randint(1000, 9999)

    obj=login()
    obj.username=email
    obj.password=password
    obj.usertype="team"
    obj.save()

    obj2=counselling_staff()
    obj2.name=staff_name
    obj2.email=email
    obj2.phone_number=phone
    obj2.LOGIN=obj
    obj2.save()
    return HttpResponse("<script>alert('Added');window.location='/adm_add_team#abc';</script>")

def adm_view_team(request):
    request.session['heading'] = "VIEW TEAM"
    res=counselling_staff.objects.all()
    return render(request, "admin/view_team.html", {'data':res})

def adm_delete_team(request, id):
    login.objects.filter(id=id).delete()
    return redirect("/adm_view_team#abc")

def adm_edit_team(request, id):
    request.session['heading'] = "EDIT TEAM"
    res=counselling_staff.objects.get(id=id)
    return render(request, "admin/edit_team.html", {'data':res})

def adm_edit_team_post(request, id):
    staff_name = request.POST['t1']
    email = request.POST['t2']
    phone = request.POST['t3']

    obj2 = counselling_staff.objects.get(id=id)
    obj2.name = staff_name
    obj2.email = email
    obj2.phone_number = phone
    obj2.save()
    return HttpResponse("<script>alert('Updated');window.location='/adm_view_team#abc';</script>")

def adm_add_tutor(request):
    request.session['heading'] = "ADD TUTOR"
    res=staff.objects.all()
    res2=course.objects.all()
    return render(request, "admin/add_tutor.html", {'data':res, 'data2':res2})

def adm_add_tutor_post(reques):
    stf=reques.POST['select']
    crs=reques.POST['select2']
    sem=reques.POST['select3']
    res=tutor.objects.filter(STAFF_id=stf)
    if res.exists():
        return HttpResponse("<script>alert('Already a tutor');window.location='/adm_add_tutor#abc';</script>")
    else:
        obj=tutor()
        obj.STAFF_id=stf
        obj.COURSE_id=crs
        obj.sem=sem
        obj.save()
        return HttpResponse("<script>alert('Tutor added');window.location='/adm_add_tutor#abc';</script>")

def adm_view_feedback(request):
    request.session['heading'] = "VIEW SUGGESTIONS"
    res=feedback.objects.all().order_by("-id")
    return render(request, "admin/view_feedback.html", {'data':res})

def adm_view_complaint(request):
    request.session['heading'] = "VIEW COMPLAINT"
    res=complaint.objects.all().order_by("-id")
    return render(request, "admin/view_complaint.html", {'data':res})

def adm_send_reply(request, id):
    request.session['heading'] = "SEND REPLY"
    return render(request, "admin/send_reply.html", {'id':id})

def adm_send_reply_post(request, id):
    rep=request.POST['t1']
    res=complaint.objects.get(id=id)
    res.reply=rep
    res.save()
    return HttpResponse("<script>alert('Replied');window.location='/adm_view_complaint#abc';</script>")



#####################               STAFF
def staff_home(request):
    request.session['heading'] = "STAFF HOME"
    return render(request, "staff/index.html")

def staff_view_profile(request):
    request.session['heading'] = "VIEW PROFILE"
    res=staff.objects.get(LOGIN_id=request.session['lid'])
    return render(request, "staff/view_profile.html", {'data':res})

def staff_send_feedback(request):
    request.session['heading'] = "SEND FEEDBACK"
    return render(request, "staff/send_feedback.html")

def staff_send_feedback_post(request):
    feed=request.POST['t1']
    res=feedback()
    res.feedback=feed
    res.date=datetime.datetime.now().strftime("%Y-%m-%d")
    res.STAFF=staff.objects.get(LOGIN_id=request.session['lid'])
    res.save()
    return HttpResponse("<script>alert('Feedback sent');window.location='/staff_send_feedback#abc';</script>")

def staff_view_allocated_batch(request):
    request.session['heading'] = "ALLOCATED BATCH"
    res=tutor.objects.filter(STAFF__LOGIN_id=request.session['lid'])
    return render(request, "staff/view_allocated_batch.html", {'data':res})

def staff_view_students(request, cid, sem):
    request.session['heading'] = "VIEW STUDENT"
    res=student.objects.filter(COURSE_id=cid, sem=sem)
    return render(request, "staff/view_student.html", {'data':res})

def staff_view_depress_students(request, cid, sem):
    request.session['heading'] = "DEPRESSED STUDENTS"
    res=student.objects.filter(COURSE_id=cid, sem=sem)
    ar=[]
    for i in res:
        # scores={"Happy":0, "Angry":0, "Neutral":0, "Surprise":0, "Sad":0, "Fear":0}
        scores={"joy":0, "anger":0, "neutral":0, "surprise":0, "sadness":0, "fear":0}
        for j in scores:
            res2=diary.objects.filter(STUDENT=i, emotion=j)
            if res2.exists():
                scores[j]=len(res2)
        total_emots=0
        for j in scores:
            total_emots+=scores[j]
        print("total ", total_emots)
        neg_emots=scores['anger'] + scores['sadness']+scores['fear']
        if total_emots == 0:
            i.mental_index =0.0
            mental_health_weakness=0.0
        else:
            mental_health_weakness=neg_emots*100 / total_emots
            i.mental_index = round(mental_health_weakness, 2)
        qscores = {"Minimal depression": 0, "Mild depression": 0, "Moderate depression": 0, "Moderately severe depression": 0, "Severe depression": 0}
        for j in qscores:
            res2=questionnaire.objects.filter(STUDENT=i, condition=j)
            if res2.exists():
                qscores[j]=len(res2)
        total_qst = 0
        for j in qscores:
            total_qst += qscores[j]
        # print("total ", total_qst)
        neg_qst = qscores['Moderate depression'] + qscores['Moderately severe depression'] + qscores['Severe depression']
        if total_qst ==0:
            i.mental_qst =0.0
        else:
            mental_health_qst = neg_qst * 100 / total_qst
            i.mental_qst = round(mental_health_qst, 2)
        if round(mental_health_weakness, 2) > 45:     #   calculate mental health for each student to identify depressed students
            ar.append(i)
        if i.mental_qst > 50:
            if i not in ar:
                ar.append(i)
        # print("neg ", neg_emots)
        print("Mental health weakness ", i.name, i.mental_index, "%", i.mental_qst, "%")
    print(ar)
    return render(request, "staff/view_depress_student.html", {'data':ar})

def staff_view_questionnairescore(request, id):
    res=questionnaire.objects.filter(STUDENT_id=id).order_by("-id")
    return render(request, "staff/view_questionnaire_scores.html", {"data":res})

def chatt(request,u):
    request.session['heading']="CHAT"
    request.session['uid'] = u
    return render(request,'staff/chat.html',{'u':u})


def chatsnd(request,u):
    d=datetime.datetime.now().date()
    c = request.session['tid']
    b=request.POST['n']
    print(b)
    print(u,"userrrrrrrrrr")
    m=request.POST['m']
    cc = tutor.objects.get(id=c)
    uu = student.objects.get(id=request.session['uid'])
    obj=chat()
    obj.date=d
    obj.type='tutor'
    obj.TUTOR=cc
    obj.STUDENT=uu
    obj.chat=m
    obj.save()
    return JsonResponse({'status':'ok'})


def chatrply(request):
    # if request.session['log']=="lo":
        c = request.session['tid']
        cc=tutor.objects.get(id=c)
        uu=student.objects.get(id=request.session['uid'])
        res = chat.objects.filter(TUTOR=cc,STUDENT=uu)
        print(res)
        v = []
        if len(res) > 0:
            print(len(res))
            for i in res:
                v.append({
                    'type':i.type,
                    'chat':i.chat,
                    'nam':i.STUDENT.name,
                    'dtime':i.date,
                    'tname':i.TUTOR.STAFF.name,
                })
            # print(v)
            return JsonResponse({"status": "ok", "data": v, "id": cc.id})
        else:
            return JsonResponse({"status": "error"})


def chatt_chatbot(request,u):
    request.session['heading']="STUDENT INTERACTION WITH CHATBOT"
    request.session['uid'] = u
    return render(request,'staff/chatbot.html',{'u':u})



def chatrply_chatbot(request):
    # if request.session['log']=="lo":
        uu=student.objects.get(id=request.session['uid'])
        res = chatbot.objects.filter(STUDENT=uu)
        print(res)
        v = []
        if len(res) > 0:
            print(len(res))
            for i in res:
                v.append({
                    'type':i.type,
                    'chat':i.chat,
                    'nam':i.STUDENT.name,
                    'dtime':i.date,
                })
            # print(v)
            return JsonResponse({"status": "ok", "data": v})
        else:
            return JsonResponse({"status": "error"})



def staff_view_councelling_team(request, sid):
    request.session['heading'] = "VIEW COUNCELLING TEAMS"
    res=counselling_staff.objects.all()
    return render(request, "staff/view_councelling_team.html", {'data':res, 'sid':sid})

def staff_make_booking(request, sid, cid):
    obj=booking()
    obj.TEAM_id=cid
    obj.STUDENT_id=sid
    obj.booked_on=datetime.datetime.now().date()
    obj.status="pending"
    obj.date="pending"
    obj.time="pending"
    obj.meet_link="Not available"
    obj.save()
    return HttpResponse("<script>alert('Schedule booked');window.location='/staff_view_allocated_batch#abc';</script>")

def staff_add_motivation(request):
    request.session['heading'] = "ADD MOTIVATION"
    return render(request, "staff/add_motivation.html")
def staff_add_motivation_post(request):
    title=request.POST['t1']
    cont=request.FILES['f1']
    d=datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    fs=FileSystemStorage()
    fs.save(static_path + "contents\\" + d +".mp4", cont)
    path="/static/contents/" + d + ".mp4"
    obj=motivation()
    obj.title=title
    obj.content=path
    obj.date=datetime.datetime.now().date()
    obj.STAFF=staff.objects.get(LOGIN_id=request.session['lid'])
    obj.save()
    return HttpResponse("<script>alert('Added');window.location='/staff_add_motivation#abc';</script>")

def staff_view_motivation(request):
    request.session['heading'] = "VIEW MOTIVATION"
    res=motivation.objects.filter(STAFF=staff.objects.get(LOGIN_id=request.session['lid'])).order_by("-id")
    return render(request, "staff/view_motivation.html", {"data":res})

def staff_delete_motivation(request, id):
    motivation.objects.filter(id=id).delete()
    return HttpResponse("<script>alert('Deleted');window.location='/staff_view_motivation#abc';</script>")


def staff_view_booking(request):
    request.session['heading'] = "VIEW BOOKING"
    res = tutor.objects.get(STAFF__LOGIN_id=request.session['lid'])
    res2=booking.objects.filter(STUDENT__COURSE=res.COURSE, STUDENT__sem=res.sem).order_by("-id")
    for i in res2:
        res3=attendance.objects.filter(BOOKING=i)
        if res3.exists():
            i.att=res3[0].status
        else:
            i.att="pending"
        res4=progress.objects.filter(BOOKING=i)
        if res4.exists():
            i.prog=res4[0].progress
        else:
            i.prog="pending"
    return render(request, "staff/view_booking.html", {"data":res2})




#####################               COUNSELLING TEAM
def team_home(request):
    request.session['heading'] = "COUNCELLING TEAM HOME"
    return render(request, "counselling_team/index.html")

def team_view_profile(request):
    request.session['heading'] = "VIEW PROFILE"
    res=counselling_staff.objects.get(LOGIN_id=request.session['lid'])
    return render(request, "counselling_team/view_profile.html", {'data':res})

def team_view_bookings(request):
    request.session['heading'] = "NEW BOOKINGS"
    res=booking.objects.filter(TEAM__LOGIN_id=request.session['lid'], status="pending").order_by("-id")
    return render(request, "counselling_team/view_bookings.html", {'data':res})
def team_view_upcoming_bookings(request):
    request.session['heading'] = "UPCOMING BOOKINGS"
    res=booking.objects.filter(TEAM__LOGIN_id=request.session['lid'], status="Scheduled").order_by("-id")
    return render(request, "counselling_team/view__upcoming_bookings.html", {'data':res})
def team_update_attendance(request, id, stat):
    res=attendance.objects.filter(BOOKING_id=id)
    if res.exists():
        res=res[0]
        res.status=stat
        res.save()
    else:
        res=attendance()
        res.BOOKING_id=id
        res.status=stat
        res.save()
    booking.objects.filter(id=id).update(status="Completed")
    return HttpResponse("<script>alert('Attendance updated');window.location='/team_view_upcoming_bookings#abc';</script>")

def team_view_previous_bookings(request):
    request.session['heading'] = "PREVIOUS BOOKINGS"
    res=booking.objects.filter(TEAM__LOGIN_id=request.session['lid'], status="Completed").order_by("-id")
    return render(request, "counselling_team/view_previous_bookings.html", {'data':res})

def team_add_progress(request, id):
    request.session['heading'] = "ADD PROGRESS"
    return render(request, "counselling_team/add_progress.html", {"id":id})

def team_add_progress_post(request, id):
    prog=request.POST['t1']
    res=progress.objects.filter(BOOKING_id=id)
    if res.exists():
        res=res[0]
        res.progress=prog
        res.save()
    else:
        res=progress()
        res.BOOKING_id=id
        res.progress=prog
        res.save()
    return HttpResponse(
        "<script>alert('Progress updated');window.location='/team_view_previous_bookings#abc';</script>")


def team_update_booking(request, id):
    request.session['heading'] = "UPDATE BOOKING"
    return render(request, "counselling_team/update_booking_time.html", {"id":id})

def team_update_booking_post(request, id):
    date = request.POST['t1']
    time = request.POST['t2']
    meet_link = request.POST['t3']
    obj=booking.objects.get(id=id)
    obj.date=date
    obj.time=time
    obj.meet_link=meet_link
    obj.status="Scheduled"
    obj.save()
    return HttpResponse("<script>alert('Booking scheduled');window.location='/team_view_bookings#abc';</script>")


def team_add_schedule(request):
    request.session['heading'] = "ADD SCHEDULE"
    return render(request, "counselling_team/add_schedule.html")

def team_add_schedule_post(request):
    date=request.POST['t1']
    f_time=request.POST['t2']
    t_time=request.POST['t3']
    res=schedule()
    res.date=date
    res.from_time=f_time
    res.to_time=t_time
    res.TEAM=counselling_staff.objects.get(LOGIN_id=request.session['lid'])
    res.save()
    return HttpResponse("<script>alert('Schedule added');window.location='/team_add_schedule#abc';</script>")

def team_view_schedules(request):
    request.session['heading'] = "VIEW SCHEDULE"
    res=schedule.objects.filter(TEAM__LOGIN_id=request.session['lid'])
    return render(request, "counselling_team/view_schedules.html", {'data':res})

def team_delete_schedule(request, id):
    schedule.objects.filter(id=id).delete()
    return HttpResponse("<script>alert('Deleted');window.location='/team_view_schedules#abc';</script>")







def logout(request):
    return HttpResponse(
        "<script>alert('You are logged out');window.location='/';</script>")







############        android
def stud_login(request):
    usr=request.POST['usr']
    psw=request.POST['psw']
    res = login.objects.filter(username=usr, password=psw)
    if res.exists():
        res = res[0]
        if res.usertype == "student":
            stud=student.objects.get(LOGIN__id=res.id)
            tut=tutor.objects.filter(COURSE=stud.COURSE, sem=stud.sem)
            if tut.exists():
                tid=tut[0].id
            else:
                tid=""
            return JsonResponse({"status":"ok", "lid":res.id, "tid":tid})
        else:
            return JsonResponse({"status": "no"})
    else:
        return JsonResponse({"status": "invalid"})

def stud_profile(request):
    lid=request.POST['lid']
    res = student.objects.get(LOGIN__id=lid)
    return JsonResponse({"status": "ok", "name":res.name, "crs":res.COURSE.crs_name, "sem":res.sem, "email":res.email,
                         "phone":res.phone_number, "addr":res.house_name + "\n" + res.place + "\n" + res.post + "\n" + res.pin})


def stud_view_diary(request):
    lid=request.POST['lid']
    res=diary.objects.filter(STUDENT__LOGIN_id=lid).order_by("-id")
    ar=[]
    for i in res:
        ar.append({
            "id":i.id, "date":i.date, "time":i.time, "cont":i.content, "emo":i.emotion
        })
    return JsonResponse({"status":"ok", "data":ar})

def stud_del_diary(request):
    did=request.POST['did']
    diary.objects.filter(id=did).delete()
    return JsonResponse({"status": "ok"})

import emoji
def is_emoji(text):
    return text in emoji.UNICODE_EMOJI_ENGLISH

import text2emotion as te
from transformers import pipeline

# Load the emotion classification model (fine-tuned for emotion detection)
classifier = pipeline("text-classification", model="j-hartmann/emotion-english-distilroberta-base")


# Define a function to detect emotion
def detect_emotion(text):
    # Get emotion prediction
    result = classifier(text)[0]
    # Print the detected emotion and the confidence score
    emotion = result['label']
    confidence = result['score']

    print(f"Emotion: {emotion}, Confidence: {confidence:.2f}")
    return emotion

def stud_add_diary(request):
    cont=request.POST['cont']
    lid=request.POST['lid']
    print(cont)
    cc=emoji.replace_emoji(cont, replace='')
    # emots = te.get_emotion(cc)
    # print(emots)
    # res = max(emots, key=emots.get)
    # print(res)
    # scr=emots[res]
    # if scr == 0:
    #     res="Neutral"
    res=detect_emotion(cc)
    obj=diary()
    obj.date=datetime.datetime.now().date()
    obj.time=datetime.datetime.now().strftime("%H:%M")
    obj.content=cont
    obj.emotion=res
    obj.STUDENT=student.objects.get(LOGIN__id=lid)
    obj.save()
    return JsonResponse({"status": "ok"})

def stud_send_complaint(request):
    comp=request.POST['cont']
    lid=request.POST['lid']
    obj=complaint()
    obj.date=datetime.datetime.now().date()
    obj.complaint=comp
    obj.reply="pending"
    obj.STUDENT=student.objects.get(LOGIN__id=lid)
    obj.save()
    return JsonResponse({"status": "ok"})

def stud_view_reply(request):
    lid=request.POST['lid']
    res=complaint.objects.filter(STUDENT__LOGIN_id=lid).order_by("-id")
    ar = []
    for i in res:
        ar.append({
            "id": i.id, "date": i.date, "comp": i.complaint, "rep": i.reply
        })
    return JsonResponse({"status": "ok", "data":ar})

def stud_delete_comp(request):
    cid=request.POST['cid']
    complaint.objects.filter(id=cid).delete()
    return JsonResponse({"status": "ok"})


def stud_view_motivation(request):
    lid=request.POST['lid']
    stud=student.objects.get(LOGIN__id=lid)
    tut=tutor.objects.filter(COURSE=stud.COURSE, sem=stud.sem)
    if tut.exists():
        tut=tut[0]
        res=motivation.objects.filter(STAFF=tut.STAFF).order_by("-id")
        ar = []
        for i in res:
            ar.append({
                "id": i.id, "date": i.date, "title": i.title, "cont": i.content, "staff":i.STAFF.name
            })
        return JsonResponse({"status": "ok", "data":ar})
    else:
        return JsonResponse({"status": "no"})


def stud_view_booking(request):
    lid=request.POST['lid']
    res=booking.objects.filter(STUDENT__LOGIN_id=lid).order_by("-id")
    ar = []
    for i in res:
        if i.date == "pending":
            sched="pending"
        else:
            sched=i.date + "  " + i.time
        ar.append({
            "id": i.id, "booked_on": i.booked_on, "sched": sched, "status": i.status,
            "meet_link":i.meet_link, "name":i.TEAM.name, "phone":i.TEAM.phone_number
        })
    return JsonResponse({"status": "ok", "data":ar})

def stud_view_schedule(request):
    res=schedule.objects.filter(date__gte=datetime.datetime.now().date())
    ar = []
    for i in res:
        ar.append({
            "date": i.date, "sched": i.from_time + " - " + i.to_time, "staff": i.TEAM.name
        })
    return JsonResponse({"status": "ok", "data": ar})

def add_chat(request):
    lid=request.POST['lid']
    toid=request.POST['toid']
    message=request.POST['message']
    obj=chat()
    obj.date=datetime.datetime.now().date()
    obj.chat=message
    obj.type="student"
    obj.STUDENT=student.objects.get(LOGIN_id=lid)
    obj.TUTOR_id=toid
    obj.save()
    return JsonResponse({"status": "ok"})

def view_chat(request):
    lid=request.POST['lid']
    toid=request.POST['toid']
    lastid=request.POST['lastid']
    print(lid, toid, lastid)
    res = chat.objects.filter(STUDENT__LOGIN_id=lid, TUTOR_id=toid, id__gt=lastid)
    print(res)
    ar = []
    for i in res:
        ar.append({
            "id": i.id,
            "date": i.date,
            "type": i.type,
            "chat": i.chat,
        })
    print(ar, "arrrrrrrrrrr")
    return JsonResponse({'status': "ok", 'data': ar})

#       chatbot
def and_chatbot_send(request):
    lid=request.POST['lid']
    msg=request.POST['message']
    obj=chatbot()
    obj.STUDENT=student.objects.get(LOGIN_id=lid)
    obj.chat=msg
    obj.date=datetime.datetime.now().date()
    obj.type="student"
    obj.save()
    response=get_response(msg)
    obj=chatbot()
    obj.STUDENT=student.objects.get(LOGIN_id=lid)
    obj.chat=response
    obj.date=datetime.datetime.now().date()
    obj.type="chatbot"
    obj.save()
    return JsonResponse({'status':"ok"})

def and_chatbot_view(request):
    lid=request.POST['lid']
    lmid=request.POST['lastid']
    res=chatbot.objects.filter(STUDENT__LOGIN_id=lid, id__gt=int(lmid))
    ar=[]
    for i in res:
        ar.append({
            "chat":i.chat, 'date':i.date, 'type':i.type, 'id':i.id
        })
    return JsonResponse({'status':'ok', 'data':ar})

#   questionnaire
def and_insert_score(request):
    lid=request.POST['lid']
    score=request.POST['score']
    cond=""
    if int(score) == 0:
        cond= "Healthy"
    elif 1 <= int(score) <= 4:
        cond= "Minimal depression"
    elif 5 <= int(score) <= 9:
        cond= "Mild depression"
    elif 10 <= int(score) <= 14:
        cond= "Moderate depression"
    elif 15 <= int(score) <= 19:
        cond= "Moderately severe depression"
    elif 20 <= int(score) <= 27:
        cond= "Severe depression"
    res=questionnaire.objects.filter(STUDENT__LOGIN_id=lid, date=datetime.datetime.now().date())
    if res.exists():
        res=res[0]
        res.score=score
        res.condition=cond
        res.date=datetime.datetime.now().date()
        res.save()
    else:
        res=questionnaire()
        res.STUDENT=student.objects.get(LOGIN_id=lid)
        res.score = score
        res.condition = cond
        res.date = datetime.datetime.now().date()
        res.save()
    return JsonResponse({'status':'ok'})

import time
def stud_emotion(request):
    lid=request.POST['lid']
    img=request.POST['img']
    timestr = time.strftime("%Y%m%d-%H%M%S")
    a = base64.b64decode(img)
    fpath=r"D:\project\loneliness_detection\myapp\static\images\\" + timestr + ".jpg"
    fh = open(fpath, "wb")
    fh.write(a)
    fh.close()

    img = cv2.imread(fpath)

    # Resize the image to the required size (usually 224x224 for many pre-trained models)
    img_resized = cv2.resize(img, (224, 224))

    # Convert to float32 and normalize
    img_normalized = np.expand_dims(img_resized, axis=0)  # Add batch dimension
    img_normalized = img_normalized.astype('float32') / 255.0
    result,a,b = DeepFace.analyze(img_normalized, actions=['emotion'])
    print(result)
    print(a)
    print(b)

    # Display the result
    print(result['emotion'])
    print(result['dominant_emotion'])
    res = result['dominant_emotion']
    # res = predict_emo(fpath)
    # K.clear_session()
    print(res)
    obj=emotion()
    obj.date=datetime.datetime.now().date()
    obj.time=datetime.datetime.now().strftime("%H-%M")
    obj.emotion=res
    obj.STUDENT=student.objects.get(LOGIN_id=lid)
    obj.save()
    return JsonResponse({'status': 'ok', "data":res})


import numpy as np
import argparse
import cv2
import os
import tensorflow as tf



model = tf.keras.models.load_model(r'D:\project\loneliness_detection\myapp\emotion_detection_model.h5')
emotion_dict = {0: "Angry", 1: "Disgusted", 2: "Fearful", 3: "Happy", 4: "Neutral", 5: "Sad", 6: "Surprised"}


# cap = cv2.VideoCapture(0)
# while True:

import keras.backend as K
def predict_emo(fpath):
    # Find haar cascade to draw bounding box around face
    # ret, frame = cap.read()
    # if not ret:
    #     break
    frame=cv2.imread(fpath)
    facecasc = cv2.CascadeClassifier(r'D:\project\loneliness_detection\myapp\haarcascade_frontalface_default.xml')
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = facecasc.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5)
    print("Faces ",len(faces))
    graph = tf.get_default_graph()
    if len(faces) > 0:
        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y-50), (x+w, y+h+10), (255, 0, 0), 2)
            roi_gray = gray[y:y + h, x:x + w]
            cropped_img = np.expand_dims(np.expand_dims(cv2.resize(roi_gray, (48, 48)), -1), 0)
            with graph.as_default():
                prediction = model.predict(cropped_img)

                maxindex = int(np.argmax(prediction))
                # cv2.putText(frame, emotion_dict[maxindex], (x+20, y-60), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
                return emotion_dict[maxindex]
    else:
        return "Neutral"
    # cv2.imshow('Video', cv2.resize(frame,(1600,960),interpolation = cv2.INTER_CUBIC))
    # if cv2.waitKey(1) & 0xFF == ord('q'):
    #     break


# cap.release()
# cv2.destroyAllWindows()