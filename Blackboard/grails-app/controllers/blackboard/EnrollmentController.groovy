package blackboard

class EnrollmentController {
	
	def showEnrollments ={ ->
		if(session.user){
		List<Enrollment> enrollmentsList = Enrollment.findAll("from Enrollment as e where e.user=?",[session.user])
		render(view:"index",model:[enrollmentsList:enrollmentsList])
		}else{
		String message = "Please log in to see your course enrollment"
		render(view:"../index",model:[message:message])
		}
	}
	
	def deleteEnrollment ={ ->
		Course course = Course.findByTitle(params.courseTitle)
		Enrollment e = Enrollment.findByCourse(course)
		if(e){
			e.delete(flush:true)
		}
		List<Enrollment> enrollmentsList = Enrollment.findAll("from Enrollment as e where e.user=?",[session.user])
		render(view:"index",model:[enrollmentsList:enrollmentsList])
		
	}
	
	
}
