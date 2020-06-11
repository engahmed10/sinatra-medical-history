user=User.create(username:"Ahmed",password_digest:"zmzmzm",email:"eng@yahoo.com")
user=User.create(username:"tom",password_digest:"xxxx",email:"ccc@yahoo.com")
member=Member.create(name:"ali",order_age:3,kinship:"brother")
member=Member.create(name:"helen",order_age:5,kinship:"sister")
history=History.create(doctor_desc:"flu,need to get rest",doctor_name:"john",date:03/11/2019,age_at_visit:15)
history=History.create(doctor_desc:"fever,take medicine for 3 days",doctor_name:"Ray",date:03/11/2010,age_at_visit:22)
disease=Disease.create(name:"Hansen’s disease",desc:" (also known as leprosy) is an infection caused by slow-growing bacteria called Mycobacterium leprae.")
disease=Disease.create(name:"Avian Influenza",desc:"Avian influenza refers to the disease caused by infection with avian (bird) influenza (flu) Type A viruses.")
procedure=Procedure.create(name:"appendectomy",desc:" An appendectomy is removing the appendix. ",age_at_proc:33,hospital:"Austin Clinic",date_porc:"11/22/2008",proce_doctor:"Tony")
procedure=Procedure.create(name:"Breast biopsy",
desc:" Breast biopsy:A biopsy is a test used to help diagnose cancer.",
age_at_proc: 44,hospital:"Houstun ",
date_porc:"10/02/2020",
proce_doctor:"Mark")
