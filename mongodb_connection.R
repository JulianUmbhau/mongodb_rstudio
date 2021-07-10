library(mongolite)

# Read environment vars
readRenviron("./.env")

# set for use in url
username <- Sys.getenv("MONGO_ROOT_USER")
password <- Sys.getenv("MONGO_ROOT_PASSWORD")

# url for mongodb://username:password@localhost:port
url = paste0("mongodb://", username, ":", password, "@mongo:27017")

# create new collection and database
c <- mongo(collection = "iris", db = "myirisdemo", url)

# inserting data into collection
c$insert(iris)

# See total database
c$aggregate()

# Second test database
c2 <- mongo(collection="test_coll", db = "test_db", url)
# create dataframe
testdata <- data.frame(aar = c(1970:2021),
                       antal_foedte = round(runif(length(1970:2021), 
                                                  5e5, 
                                                  7e5)))
# insert into new database
c2$insert(testdata)
# Show data
c2$aggregate()
