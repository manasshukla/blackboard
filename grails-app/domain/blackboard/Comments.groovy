package blackboard

class Comments {	
	String commentData;
	static belongsTo = [post:Post]
    static constraints = {
    }
}
