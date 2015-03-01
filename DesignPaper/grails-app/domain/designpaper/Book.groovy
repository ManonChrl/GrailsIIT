package designpaper

class Book extends Item {

	String title
	Author author
    static constraints = {
    }
	public String toString(){
		title+" by "+author
	}
}
