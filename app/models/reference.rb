=begin

Model: Reference

The Reference model stores information about a student's request for
a reference letter (i.e. thes student's id, the professor's id, the student's
message to professor, professor's reference letter, and whether professor has
rejected/accepted the reference request).
=end

class Reference < ActiveRecord::Base

    belongs_to :user
    belongs_to :project_application

end
