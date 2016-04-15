use DBI;

my $db="world";
my $host="localhost";
my $user="root";
my $password="Test123";  # the root password

#connect to MySQL database
my $dbh   = DBI->connect ("DBI:mysql:database=$db:host=$host",
                           $user,
                           $password) 
                           or die "Can't connect to database: $DBI::errstr\n";

my $sth = $dbh->prepare( "select name,population from city where countrycode = 'AFG'");

#execute the query
$sth->execute();
## Retrieve the results of a row of data and print
print "\tQuery results:\n================================================\n";

while ( my @row = $sth->fetchrow_array( ) )  {
         print "@row\n";
}
warn "Problem in retrieving results", $sth->errstr( ), "\n"
        if $sth->err( );

exit;