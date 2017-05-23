class BookmarkPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            scope
        end
    end
  
    def show?
        record.topic.user == user
    end
    
    def create? 
        record.topic.user == user
    end
    
    def update?
        record.topic.user == user
    end
    
    def destroy?
        record.topic.user == user
    end
end
