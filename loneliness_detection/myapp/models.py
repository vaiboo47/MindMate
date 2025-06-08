from django.db import models

# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    usertype=models.CharField(max_length=100)

class department(models.Model):
    dep_name=models.CharField(max_length=100)

class course(models.Model):
    crs_name=models.CharField(max_length=100)
    DEPARTMENT=models.ForeignKey(department, on_delete=models.CASCADE)

class student(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone_number=models.CharField(max_length=100)
    house_name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.CharField(max_length=100)
    sem=models.CharField(max_length=100)
    COURSE=models.ForeignKey(course, on_delete=models.CASCADE)
    LOGIN=models.ForeignKey(login, on_delete=models.CASCADE)

class staff(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone_number=models.CharField(max_length=100)
    qualification=models.CharField(max_length=100)
    experience=models.CharField(max_length=100)
    DEPARTMENT=models.ForeignKey(department, on_delete=models.CASCADE)
    LOGIN=models.ForeignKey(login, on_delete=models.CASCADE)

class tutor(models.Model):
    sem=models.CharField(max_length=100)
    COURSE=models.ForeignKey(course, on_delete=models.CASCADE)
    STAFF=models.ForeignKey(staff, on_delete=models.CASCADE)

class counselling_staff(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone_number=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(login, on_delete=models.CASCADE)

class feedback(models.Model):
    date=models.CharField(max_length=100)
    feedback=models.CharField(max_length=100)
    STAFF=models.ForeignKey(staff, on_delete=models.CASCADE)

class complaint(models.Model):
    date=models.CharField(max_length=100)
    complaint=models.CharField(max_length=100)
    reply=models.CharField(max_length=100)
    STUDENT=models.ForeignKey(student, on_delete=models.CASCADE)

class booking(models.Model):
    booked_on=models.CharField(max_length=100, default="")
    date=models.CharField(max_length=100)
    time=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    meet_link=models.CharField(max_length=100)
    STUDENT=models.ForeignKey(student, on_delete=models.CASCADE)
    TEAM=models.ForeignKey(counselling_staff, on_delete=models.CASCADE)

class attendance(models.Model):
    status=models.CharField(max_length=100)
    BOOKING=models.ForeignKey(booking, on_delete=models.CASCADE)

class progress(models.Model):
    date=models.CharField(max_length=100)
    progress=models.CharField(max_length=100)
    BOOKING=models.ForeignKey(booking, on_delete=models.CASCADE)

class motivation(models.Model):
    date=models.CharField(max_length=100)
    title=models.CharField(max_length=100)
    content=models.CharField(max_length=100)
    STAFF=models.ForeignKey(staff, on_delete=models.CASCADE)

class schedule(models.Model):
    date=models.CharField(max_length=100)
    from_time=models.CharField(max_length=100)
    to_time=models.CharField(max_length=100)
    TEAM = models.ForeignKey(counselling_staff, on_delete=models.CASCADE)


class diary(models.Model):
    date=models.CharField(max_length=100)
    time=models.CharField(max_length=100)
    content=models.CharField(max_length=500)
    emotion=models.CharField(max_length=100, default="neutral")
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)


class chat(models.Model):
    date=models.CharField(max_length=100)
    chat=models.CharField(max_length=300)
    type=models.CharField(max_length=300)
    TUTOR = models.ForeignKey(tutor, on_delete=models.CASCADE)
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE, default=1)

class chatbot(models.Model):
    date=models.CharField(max_length=100)
    chat=models.CharField(max_length=300)
    type=models.CharField(max_length=300)
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)

class questionnaire(models.Model):
    date=models.CharField(max_length=100)
    score=models.CharField(max_length=300)
    condition=models.CharField(max_length=300)
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)

class emotion(models.Model):
    date=models.CharField(max_length=100)
    time=models.CharField(max_length=300)
    emotion=models.CharField(max_length=300)
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)
