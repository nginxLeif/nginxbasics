curl -o /dev/null -X POST -F "weblog_title=My Awesome Site 1" -F "user_name=wpadmin" -F "admin_password=wppassword" -F "admin_password2=wppassword" -F "pw_weak=on" -F "admin_email=wpadmin@mysite.invalid" -F "blog_public=0" -F "Submit=Install WordPress" -F "language=en_GB" http://localhost:8001/wp-admin/install.php?step=2
curl -o /dev/null -X POST -F "weblog_title=My Awesome Site 2" -F "user_name=wpadmin" -F "admin_password=wppassword" -F "admin_password2=wppassword" -F "pw_weak=on" -F "admin_email=wpadmin@mysite.invalid" -F "blog_public=0" -F "Submit=Install WordPress" -F "language=en_GB" http://localhost:8002/wp-admin/install.php?step=2
curl -o /dev/null -X POST -F "weblog_title=My Awesome Site 3" -F "user_name=wpadmin" -F "admin_password=wppassword" -F "admin_password2=wppassword" -F "pw_weak=on" -F "admin_email=wpadmin@mysite.invalid" -F "blog_public=0" -F "Submit=Install WordPress" -F "language=en_GB" http://localhost:8003/wp-admin/install.php?step=2
curl -o /dev/null -X POST -F "weblog_title=My Awesome Site 4" -F "user_name=wpadmin" -F "admin_password=wppassword" -F "admin_password2=wppassword" -F "pw_weak=on" -F "admin_email=wpadmin@mysite.invalid" -F "blog_public=0" -F "Submit=Install WordPress" -F "language=en_GB" http://localhost:8004/wp-admin/install.php?step=2
curl -o /dev/null -X POST -F "weblog_title=My Awesome Site 5" -F "user_name=wpadmin" -F "admin_password=wppassword" -F "admin_password2=wppassword" -F "pw_weak=on" -F "admin_email=wpadmin@mysite.invalid" -F "blog_public=0" -F "Submit=Install WordPress" -F "language=en_GB" http://localhost:8005/wp-admin/install.php?step=2

docker exec nginxbasics_wordpress1_1 /usr/local/bin/wp --path=/usr/src/wordpress theme install twentyseventeen --activate
docker exec nginxbasics_wordpress2_1 /usr/local/bin/wp --path=/usr/src/wordpress theme install twentyseventeen --activate
docker exec nginxbasics_wordpress3_1 /usr/local/bin/wp --path=/usr/src/wordpress theme install twentyseventeen --activate
docker exec nginxbasics_wordpress4_1 /usr/local/bin/wp --path=/usr/src/wordpress theme install twentyseventeen --activate
docker exec nginxbasics_wordpress5_1 /usr/local/bin/wp --path=/usr/src/wordpress theme install twentyseventeen --activate

grep -qF -- 'remove_filter("template_redirect","redirect_canonical");' wp1/themes/twentyseventeen/functions.php || sed -i '1 a remove_filter("template_redirect","redirect_canonical");' wp1/themes/twentyseventeen/functions.php
grep -qF -- 'remove_filter("template_redirect","redirect_canonical");' wp2/themes/twentyseventeen/functions.php || sed -i '1 a remove_filter("template_redirect","redirect_canonical");' wp2/themes/twentyseventeen/functions.php
grep -qF -- 'remove_filter("template_redirect","redirect_canonical");' wp3/themes/twentyseventeen/functions.php || sed -i '1 a remove_filter("template_redirect","redirect_canonical");' wp3/themes/twentyseventeen/functions.php
grep -qF -- 'remove_filter("template_redirect","redirect_canonical");' wp4/themes/twentyseventeen/functions.php || sed -i '1 a remove_filter("template_redirect","redirect_canonical");' wp4/themes/twentyseventeen/functions.php
grep -qF -- 'remove_filter("template_redirect","redirect_canonical");' wp5/themes/twentyseventeen/functions.php || sed -i '1 a remove_filter("template_redirect","redirect_canonical");' wp5/themes/twentyseventeen/functions.php

docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp1 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='siteurl';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp1 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='home';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp2 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='siteurl';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp2 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='home';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp3 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='siteurl';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp3 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='home';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp4 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='siteurl';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp4 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='home';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp5 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='siteurl';"
docker exec nginxbasics_db_1 mysql -uroot -psomewordpresspassword -D wp5 -e "UPDATE wp_options SET option_value='http://wp.nginx.local' WHERE option_name='home';"

grep -qF -- "throw new Exception(\"Without failure how would we recognize success?\");" wp3/themes/twentyseventeen/index.php || sed -i '1 a throw new Exception("Without failure how would we recognize success?");' wp3/themes/twentyseventeen/index.php
grep -qF -- "sleep(5);" wp4/themes/twentyseventeen/index.php || sed -i '1 a sleep(5);' wp4/themes/twentyseventeen/index.php


