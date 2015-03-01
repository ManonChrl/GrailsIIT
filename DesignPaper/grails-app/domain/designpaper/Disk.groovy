package designpaper

class Disk extends Item{

	String title
	Date publicationDate
    static constraints = {
    }
	public String toString(){
		title + " from " + publicationDate
	}
}
