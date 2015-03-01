package designpaper

class User {

	String login
	String password
	String firstName
	String lastName
	String role
    static constraints = {
    }
	
	public String toString(){
		firstName + " " + lastName
	}
}
