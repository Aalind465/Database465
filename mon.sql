// Here is the database with collection as students 
db.student.insertMany(
   [{ course: "python",
       no_of_sessions: 50,
     instructor: "aalind",
     no_of_assignment : 5
   },
   { course: "java",
       no_of_sessions: 40,
     instructor: "aayush",
     no_of_assignment : 10
   },
   { course: "c++",
       no_of_sessions: 20,
     instructor: "mayur",
     no_of_assignment : 10
   },
   { course: "IOT",
       no_of_sessions: 70,
     instructor: "RAHUL",
     no_of_assignment : 20
   },
   { course: "DATA STURCTURES AND ALGORITHM",
       no_of_sessions: 80,
     instructor: "ritik",
     no_of_assignment : 5
   },
   { course: "TOC",
       no_of_sessions: 30,
     instructor: "VIKAS",
     no_of_assignment : 7
   }
   
   ]
)
// this is updateMany() function to update the documents in collections
db.student.updateMany(
    {  no_of_assignment: 7}, 
    { $set: {  no_of_assignment: 10 }}
)
// this is how to check the updated data
db.getCollection('students').find({})