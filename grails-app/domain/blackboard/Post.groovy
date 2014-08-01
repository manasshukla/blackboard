package blackboard

import grails.rest.*

//@Resource(uri='post')
class Post {
	String postData;
	Date lastUpdated;
	Date dateCreated;
	static hasMany = [comments: Comments]
    static constraints = {
    }
}
