us=User.create(username:"ahmed",email:"eng@yahoo.com",password:"man1")

member1=Member.create(name:"Ahmed",order_age:1,kinship:"dad",user:us)
member2=Member.create(name:"Ghaliya",order_age:2,kinship:"wife",user:us)
member3=Member.create(name:"Aylin",order_age:3,kinship:"daughter",user:us)
disease1=Disease.create(name:"Hansen’s disease",desc:" (also known as leprosy) is an infection caused by slow-growing bacteria called Mycobacterium leprae.")
disease2=Disease.create(name:"Avian Influenza",desc:"Avian influenza refers to the disease caused by infection with avian (bird) influenza (flu) Type A viruses.")
history1=History.create(doctor_desc:"flu,need to get rest",doctor_name:"john",date:03/11/2019,age_at_visit:15,member:member1,disease:disease1)
history2=History.create(doctor_desc:"fever,take medicine for 3 days",doctor_name:"Ray",date:03/11/2010,age_at_visit:22,member:member2,disease:disease2)

procedure=Procedure.create(name:"appendectomy",desc:" An appendectomy is removing the appendix. ",age_at_proc:33,hospital:"Austin Clinic",date_porc:"11/22/2008",proce_doctor:"Tony",member:member1,disease:disease1)
procedure=Procedure.create(name:"Breast biopsy",
desc:" Breast biopsy:A biopsy is a test used to help diagnose cancer.",
age_at_proc: 44,hospital:"Houstun ",
date_porc:"10/02/2020",
proce_doctor:"Mark",member:member2,disease:disease2)
