package designpaper

class Magazine extends Item{

	String name
	Date publicationDate
    static constraints = {
    }
	public String toString(){
		name + " from " + publicationDate 
	}
}
