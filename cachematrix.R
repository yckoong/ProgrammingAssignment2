makeCacheMatrix <- function(x = matrix()) { ## define "matrix"
  inv <- NULL                             ## initialize inv as NULL
  set <- function(y) {                    ## define the set function
    x <<- y                             ## assign y to x
    inv <<- NULL                        ## if there is a new inv, reset inv to NULL
    }
    get <- function() x                     ## define the get fucntion
    setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv 
    getinverse <- function() inv                     ## gets the value of inv 
    list(set = set, 
         get = get, 
         setinverse = setinverse, 
         getinverse = getinverse)                                                                     
}

cacheSolve <- function(x, ...) {## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
