package blackboard

class CourseController {
	
	def showCourses ={ ->
		List<Course> coursesList = Course.findAll()
		if(!session.username){
			String message = "Please log in if you want to register to courses"
			render(view:"index",model:[coursesList:coursesList,message:message])
		}else{
			render(view:"index",model:[coursesList:coursesList])
		}
	}
	
	def register ={ ->
		
		String message = ""
		Boolean alreadyRegistered=false
		Course course = Course.findByTitle(params.courseTitle)
		List<Enrollment> eList = Enrollment.findAll("from Enrollment as e where e.user=:user and e.course=:course",[user:session.user,course:course])
		
		if(course && session.user){
			if(eList.size()==1){
					alreadyRegistered=true
			}
			if(alreadyRegistered){
				message="You are already registered to this course !"
				List<Course> coursesList = Course.findAll()
				
				render(view:"index",model:[message:message,coursesList:coursesList])
			}else{
				def enrollmentToAdd = new Enrollment(user:session.user,course:course)
				enrollmentToAdd.save(flush:true)
				message = "User $session.user has registered to course : $course."
				List<Course> coursesList = Course.findAll()
				render(view:"index",model:[message:message,coursesList:coursesList])
			}
		}else{
			message = "Error in finding the course you want"
			render (view:"../error",model:[message:message])
		}	
	}
	
	def search ={ ->
		int count =0
		String query = params.query.toLowerCase()
		List<Course> coursesList = Course.findAll()
		List<Course> coursesRendered = new ArrayList<Course>();
		for(Course c : coursesList){
			if(c.title.toLowerCase().contains(query) || c.description.toLowerCase().contains(query)){
				if(count<5){
					coursesRendered.add(c)
					count++
				}
			}
		}
		if(!session.username){
			String message = "Please log in if you want to register to courses"
			render(view:"index",model:[coursesRendered:coursesRendered,message:message])
		}else{
			render(view:"index",model:[coursesRendered:coursesRendered])
		}
		
	}

}
