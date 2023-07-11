print " \n \U would you like to input any address to the data base \n";
print " \n y-agree n-disagre";

$a = <STDIN>;

chomp($a);

if($a eq 'y')
{
    while ($a eq 'y')
    {
        &get_info;
        print" \n \U would you like to input any more address to the database \n"
        $a = <STDIN>;
        chomp($a);    
        }
}

if ($a eq 'n')
{
    print " \n \U would you like to search any address from the data base";
    print " y - agree n - disagree";
    $b = <STDIN>;

    chomp($b);

    if ($b eq 'y')
    {
        while ($b eq 'y')
        {
            &search_info;
            print "\n \U would you like to search any more address from database \n";
            $b = <STDIN>;
            chomp($b);

        }
    }

    if ($b eq 'n')
    {
        print " \n THANK YOU FOR YOUR INTEREST \n";
    }

    else
    {
        print "\n check whether you typed 'y'/'n'  \n";
        print "\n 'y' - agree 'n' - disagree \n";
        print "welcome";
    }
}

else 
{
    print "\n check whether you typed 'y'/'n'  \n";
    print "\n 'y' - agree 'n' - disagree \n";
    print "welcome";
}


sub get_info
{
    print "please give the following information";
    print "Name : \n";

    $e = <STDIN>;
    chomp($e);
    $e = uc $e;

    print "House no :  \n";
    $f = <STDIN>;
    chomp($f);

    print "Street name :  \n";
    $g = <STDIN>;
    chomp($g);
    $g = ucfirst $g;

    print "city name : \n"
    $h = <STDIN>;
    chomp($h);
    $h = ucfirst $h;

    print "PIN : \n";
    $i = <STDIN>;
    chomp($i);

    print " \U Date of Birth \n";
    print " Date  : \n";
    $k = <STDIN>;
    chomp($k);

    print "Month : \n";
    $l = <STDIN>;
    chomp($l);

    print "Year : \n";
    $m = <STDIN>;
    chomp ($m);

    print "Phone no : \n";
    $ph = <STDIN>;
    chomp($ph);

    print "Email ID : \n";
    $email = <STDIN>;
    chomp($email);

    

    open (ADDFILE, ">>add_file.txt")

    print ADDFILE "\n ______________________________________\n";
    print ADDFILE "Name : $e \n";
    print ADDFILE "House no : $f \n";
    print ADDFILE "Street : $g \n";
    print ADDFILE "City : $h \n";
    print ADDFILE "Pin : $i \n\n\n";
    print ADDFILE "Date of birth : $k - $l - $m \n";
    print ADDFILE "Phone : $ph \n";
    print ADDFILE "Email: $email \n\n";
    print ADDFILE "\n___________________________________________\n"

    close(ADDFILE)
}


sub search_info
{
    open (ADDFILE , "add_file.txt");

    print "Type the name of the person \n";
    print "Use lower case letters only \n";

    $n =<STDIN>;
    chomp($n);

    $n = uc $n;

    $match = 0;

    $text = <ADDFILE>;

    while($text)
    {
        if ($text =~ /n/)
        {
            print " \n ******************* \n";
            for ($q=0; $q<=10; $q++ )
            {
                print "$text \n";
                $text = <ADDFILE>;
            }
            print "\n********************* \n";
            $match++;
        }

        else 
        {
            $text = <ADDFILE>;
        }
    }

if($match != 0)
{ print " \n \U Number of matching addresses found for $n --- $match \n"; }
else
{print " \n \U no matching addresses found - please try again - Thanks \n";}

close(ADDFILE);
}