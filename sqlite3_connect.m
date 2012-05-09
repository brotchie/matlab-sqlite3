function [hConnection] = sqlite3_connect(dbpath)

% Set this to the location of the sqlitehdbc jar file.
SQLITE_JDBC_JAR = [getenv('HOME') filesep 'contrib/sqlitejdbc-v056.jar'];

% Put the sqlite jdbc jar in the Matlab classpath.
if ~any(strcmp(SQLITE_JDBC_JAR, javaclasspath))
    javaaddpath(SQLITE_JDBC_JAR);
end

hConnection = database('', '', '', 'org.sqlite.JDBC', ['jdbc:sqlite:' dbpath]);
