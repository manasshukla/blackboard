package blackboard



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CommentsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comments.list(params), model:[commentsInstanceCount: Comments.count()]
    }

    def show(Comments commentsInstance) {
        respond commentsInstance
    }

    def create() {
        respond new Comments(params)
    }

    @Transactional
    def save(Comments commentsInstance) {
        if (commentsInstance == null) {
            notFound()
            return
        }

        if (commentsInstance.hasErrors()) {
            respond commentsInstance.errors, view:'create'
            return
        }

        commentsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comments.label', default: 'Comments'), commentsInstance.id])
                redirect commentsInstance
            }
            '*' { respond commentsInstance, [status: CREATED] }
        }
    }

    def edit(Comments commentsInstance) {
        respond commentsInstance
    }

    @Transactional
    def update(Comments commentsInstance) {
        if (commentsInstance == null) {
            notFound()
            return
        }

        if (commentsInstance.hasErrors()) {
            respond commentsInstance.errors, view:'edit'
            return
        }

        commentsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comments.label', default: 'Comments'), commentsInstance.id])
                redirect commentsInstance
            }
            '*'{ respond commentsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Comments commentsInstance) {

        if (commentsInstance == null) {
            notFound()
            return
        }

        commentsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comments.label', default: 'Comments'), commentsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comments.label', default: 'Comments'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
