# cycles through a vector x and returns logical TRUE if pattern "p" is found
mygrep <- function(p,x)
{
      b<-logical(length(x))
      for (i in 1:length(x))
      {
            t<-as.logical(grep(pattern=p,x[i])>0,ignore.case=TRUE)
            if (length(t)>0)
            {
                  b[i]<-TRUE
            }
      }
      b
}
