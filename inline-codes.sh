#!/bin/bash
echo -e "\n----------------------------------------------\nRESULTADOS:\n"
echo -e 'class Main {
  public static void main(String args[]) {
    System.out.println("Java:   " + (0.1 + 0.2));
  }
}' > Main.java && javac *.java && java Main && rm Main.{java,class}

# echo "Shell:  $((0.1 + 0.2))"
node -p '"NodeJS: "+(0.1 + 0.2)'
ruby -e   'print "Ruby:   "; print 0.1 + 0.2; print "\n"'
perl <<<  'print "Perl:   "; print 0.1 + 0.2; print "\n"'
python -c 'print "Python:", (0.1 + 0.2)'
php -r    'print "PHP:    ".(0.1 + 0.2)."\n";'
