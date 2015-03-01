package blackboard

class UserController {
	
	def doLogin = { ->
		
		String message = ""
		String username = params.username
		String password = params.password
		byte[] passwordHash = password.encodeAsSHA1Bytes()
		def connection = false
		def user = new User()
		user = User.findByUsername(username);
		if (user) {
			if(""+passwordHash==""+user.password){
				connection = true
				session['username']=username
				session['password']=passwordHash
				session['user']=user
			}else{
				message = "Wrong Password"
			}
		}else{
			message = "Username not found"
		}
		if (connection)
			render(view:"../index", model:[user:user,connection:connection])
		else
		render(view:"../index",model:[message:message])
	}
	
	def doLogout ={ ->
		session.username=""
		session.user=""
		String message = "You are logged out !"
		render(view:"../index",model:[message:message])
	}
	
	
	def doRegister ={ ->
		String username = params.username
		String password = params.password
		byte[] passwordHash = password.encodeAsSHA1Bytes()
		def message = ""
		def connection = false
		
		if(User.findByUsername(username)){
			message += "Username already exists !"
		}
		if(params.username==""){
			message += "\nUsername field is needed !\n"
		}
		if(params.password==""){
			message += "\nPassword field is needed !\n"
		}
		if( User.findByUsername(username) || params.password=="" || params.username==""){
			render(view:"register",model:[message:message])
		}else{
			def user = new User(username:username,password:""+passwordHash)
			user.save(flush:true)
			message = "User credentials are saved"
			render(view:"../index",model:[message:message])
		}
    }
		
	def register ={ ->
		render(view:"register")
	}
		
}


