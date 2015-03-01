import blackboard.User
import blackboard.Course

class BootStrap {

    def init = { servletContext ->
		def password = "mchancer"
		byte[] passwordHash = password.encodeAsSHA1Bytes()
		def aSampleUser = new User (username:"mchancer",password:""+passwordHash+"")
		aSampleUser.save(flush:true)
		def aSampleCourse = new Course (title:"Web Site Application Development",description:"Programming the Common Gateway Interface (CGI) for Web pages is introduced with emphasis on creation of interfaces to handle HTML form data.", creditHours:"3")
		def aSampleCourse1 = new Course (title:"Intermediate Web Application Development",description:"In-depth examination of the concepts involved in the development of Internet applications.", creditHours:"3")
		def aSampleCourse2 = new Course (title:"Advanced Software Programming",description:"This course considers Web container application development for enterprise systems.", creditHours:"3")
		def aSampleCourse3 = new Course (title:"Consulting for Technical Professionals",description:"This course explores the application of technology and technical management skills to working with business, industry, or various professions in solving specific problems for an organization as an internal or external consultant. ", creditHours:"3")
		def aSampleCourse4 = new Course (title:"Open Source Programming",description:"Contemporary open-source programming languages and frameworks are presented.", creditHours:"3")
		def aSampleCourse5 = new Course (title:"Data warehousing",description:"This class will introduce the student to concepts needed for successfully designing, building and implementing a data warehouse.", creditHours:"3")
		def aSampleCourse6 = new Course (title:"Intelligent Device Application",description:"Intelligent device application development is covered with various technologies on mobile and robotic platforms.", creditHours:"3")
		def aSampleCourse7 = new Course (title:"Rich Internet Applications",description:"Students learn to create interactive rich Internet applications using Web development frameworks, applications, and techniques that primarily operate on the client-side.", creditHours:"3")
		def aSampleCourse8 = new Course (title:"Wireless technologies and applications",description:"This course will provide students with the knowledge of wireless communication technologies.", creditHours:"3")
		def aSampleCourse9 = new Course (title:"Cloud computing technologies",description:"Computing applications hosted on dynamically-scaled, virtual resources available as services are considered.", creditHours:"3")
		def aSampleCourse10 = new Course (title:"Telecommunications technology",description:"This course introduces technologies underlying telecommunications and real-time communications systems and services.", creditHours:"3")
		def aSampleCourse11 = new Course (title:"Coding Security",description:"This course examines security architecture elements within modern object-oriented programming languages that create the framework for secure programming.", creditHours:"3")
		def aSampleCourse12 = new Course (title:"Database Security",description:"Students will engage in an in-depth examination of topics in data security including security considerations", creditHours:"3")
		def aSampleCourse13 = new Course (title:"Steganography",description:"Digital steganography is the science of hiding covert information in otherwise innocent carrier files so that the observer is unaware that hidden information exists.", creditHours:"3")
		
		
		
		aSampleCourse.save(flush:true)
		aSampleCourse1.save(flush:true)
		aSampleCourse2.save(flush:true)
		aSampleCourse3.save(flush:true)
		aSampleCourse4.save(flush:true)
		aSampleCourse5.save(flush:true)
		aSampleCourse6.save(flush:true)
		aSampleCourse7.save(flush:true)
		aSampleCourse8.save(flush:true)
		aSampleCourse9.save(flush:true)
		aSampleCourse10.save(flush:true)
		aSampleCourse11.save(flush:true)
		aSampleCourse12.save(flush:true)
		aSampleCourse13.save(flush:true)
    }
    def destroy = {
    }
}
