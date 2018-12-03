## The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to

#set the value of the matrix
#get the value of the matrix
#set the value of the inverse
#get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        inverse_variable <- NULL
        set <- function(y) {
                x <<- y
                inverse_variable <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inverse_variable <<- inverse
        getinverse <- function() inverse_variable
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## The following function calculates the inverse of the special "matrix" 
#created with the above function. However, it first checks to see if 
#the inverse has already been calculated. If so, it gets the inverse from the 
#cache and skips the computation. Otherwise, it calculates the inverse of 
#the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        inverse_variable <- x$getinverse()
        if(!is.null(inverse_variable)) {
                message("getting cached data")
                return(inverse_variable)
        }
        data <- x$get()
        inverse_variable <- solve(data, ...)
        x$setinverse(inverse_variable)
        m## Return a matrix that is the inverse of 'x'
}
