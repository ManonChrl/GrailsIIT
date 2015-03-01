package designpaper

class UserController {

    def scaffold = true
	
	def doLogin = { ->
		
		String message = ""
		String login = params.login
		String password = params.password
		byte[] passwordHash = password.encodeAsSHA1Bytes()
		def connection = false
		
		def user = new User()
		user = User.findByLogin(login);
		def role = user.role
		if (user) {
			if(""+passwordHash==""+user.password){
				connection = true
				session['login']=login
				session['password']=passwordHash
				session['user']=user
				session['role']=role
			}else{
				message = "Wrong Password"
			}
		}else{
			message = "Login not found"
		}
		if (connection)
			render(view:"../index", model:[user:user,connection:connection])
		else
		render(view:"../index",model:[message:message])
	}
	
	def doLogout ={ ->
		session.login=""
		session.user=""
		session.role=""
		String message = "You are logged out !"
		render(view:"../index",model:[message:message])
	}
}
