SET ( AWK_FIND_REQUIRED FALSE )
SET ( Boost_FIND_REQUIRED TRUE )
SET ( Boost_USE_MULTITHREADED ON )
SET ( Boost_USE_STATIC_LIBS OFF )
SET ( Boost_USE_STATIC_RUNTIME OFF )
SET ( CUT_FIND_REQUIRED FALSE )
SET ( SED_FIND_REQUIRED FALSE )
SET ( PGSQL_FIND_REQUIRED TRUE )
SET ( PISTACHE_FIND_REQUIRED TRUE )
SET ( JWT_FIND_REQUIRED TRUE )
SET ( PQXX_FIND_REQUIRED TRUE )
SET ( THREADS_FIND_REQUIRED TRUE )
SET ( OPENSSL_FIND_REQUIRED TRUE )
SET ( TR_FIND_REQUIRED FALSE )
SET ( VMIME_FIND_REQUIRED TRUE )


IF ( NOT WIN32 )
    SET ( THREADS_PREFER_PTHREAD_FLAG TRUE )
ENDIF (  )


### Boost ###
FIND_PACKAGE (Boost 1.55.0
    COMPONENTS
        date_time filesystem system log log_setup regex system thread locale
    )
INCLUDE_DIRECTORIES ( SYSTEM ${BOOST_INCLUDE_DIRS} )

### Common Unix Utilities ###
FIND_PACKAGE ( CommonUnixUtilities )

### pgSQL ###
FIND_PACKAGE ( pgSQL
  COMPONENTS
    pq
)
INCLUDE_DIRECTORIES ( SYSTEM ${PGSQL_INCLUDE_DIR} )


### Pistache ###
FIND_PACKAGE ( Pistache
  COMPONENTS
    pistache
)
INCLUDE_DIRECTORIES ( SYSTEM ${PISTACHE_INCLUDE_DIR} )

### jwt ###
FIND_PACKAGE ( jwt
  COMPONENTS
    jwt
)
INCLUDE_DIRECTORIES ( SYSTEM ${JWT_INCLUDE_DIR} )

### pqxx ###
FIND_PACKAGE ( pqxx
  COMPONENTS
    pqxx
)
INCLUDE_DIRECTORIES ( SYSTEM ${PQXX_INCLUDE_DIR} )

### Openssl ###
FIND_PACKAGE ( Openssl
  COMPONENTS
   ssl crypto
)
INCLUDE_DIRECTORIES ( SYSTEM ${OPENSSL_INCLUDE_DIR} )

### Threads ###
FIND_PACKAGE ( Threads )
IF ( NOT THREADS_FOUND )
    IF ( THREADS_FIND_REQUIRED )
        MESSAGE ( FATAL_ERROR "Could not find Threads" )
    ENDIF (  )
ENDIF ( )

### VMime ###
FIND_PACKAGE ( VMime )
INCLUDE_DIRECTORIES ( SYSTEM ${VMIME_INCLUDE_DIR} )
