class StudentsController < ApplicationController
    def index
        @students = Student.all
      end
    
      def show
        @student = Student.find(params[:id])
      end
    
      def new
        @student = Student.new
      end
    
      def create
        @student = Student.new(post_params(:first_name, :last_name))
        @student.save
        redirect_to student_path(@student)
      end

      def update
        @student = Student.find(params[:id])
        @student.update(post_params(:first_name, :last_name))
        redirect_to student_path(@student)
        # raise params.inspect
        # ^ this line will cause the application to pause and print out params on an error page
      end
    
      def edit
        @student = Student.find(params[:id])
      end

      private
      def post_params(*args)
        params.require(:student).permit(*args)
      end
end