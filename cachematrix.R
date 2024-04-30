## Put comments here that give an overall description of what your
## functions do
## a pair of functions  that can cache the inverse of a matrix

## Write a short comment describing this function
#creates a special matrix object that can cache its inverse


#function that sets the matrix and its inverse in an environment
makeCacheMatrix <- function( m = matrix() ) {
        
        #initializes the inverse property
        inv <- NULL
        
        #sets the matrix
        set <- function( matrix ) {
                m <<- matrix
                inv <<- NULL
        }
        
        #gets the matrix
        get <- function() {
                m          
        }
        
        #sets the inverse of the matrix
        setInverse <- function(inverse) {
                inv <<- inverse
        }

        #gets the inverse of the matrix
        getInverse <- function() {
                ## Return the inverse property
                inv
        }
        
        #returns a list of the methods
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

#computes and caches the inverse of a matrix
cacheSolve <- function(m, ...) {
        
        #returns a matrix that is the inverse of 'x'
        inv <- m$getInverse()
        
        #just returns the inverse if its already set
        if( !is.null(inv) ) {
                message("getting cached data")
                return(inv)
        }
        
        #gets the matrix from our object
        data <- m$get()
        
        #calculates the inverse using matrix multiplication
        inv <- solve(data,...)
        
        #sets the inverse to the object
        m$setInverse(inv)
        
        #returns the matrix
        inv
}