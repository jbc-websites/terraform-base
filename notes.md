url https://api.wordpress.org/secret-key/1.1/salt/ | tee temp_secret
sudo -u www-data sed -i "45s/define('AUTH_KEY','put your unique phrase here')/define('AUTH_KEY','BLABLA'/" wp-config.php

curl https://api.wordpress.org/secret-key/1.1/salt/ 
sudo sed -i "45s/put your unique phrase here//" wp-config.php

sed -n '1, 3p' temp_secret > wp-config.php

cat temp_secret | tail -n +1 | head -5000 > wp-config.php

#append to line n45
sed '45s/3696/& running/' file.txt 

# to insert a env var
sed -i "1i $var" file.txt

export content=$(curl https://api.wordpress.org/secret-key/1.1/salt/)

sed -i "temp_secret" wp-config.php