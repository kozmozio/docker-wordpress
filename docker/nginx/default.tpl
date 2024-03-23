server {
    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;

#    include %home%/%user%/conf/web/%domain%/nginx.forcessl.conf*;

    location ~ /\.(?!well-known\/|file) {
        deny all;
        return 404;
    }

    location / {
        proxy_pass      http://%ip%:8282;
        location ~* ^.+\.(%proxy_extentions%)$ {
            root           %docroot%/[FOLDER-SITE];
            access_log     /var/log/%web_system%/domains/%domain%.log combined;
            access_log     /var/log/%web_system%/domains/%domain%.bytes bytes;
            expires        max;
            try_files      $uri @fallback;
        }
    }

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }

    location @fallback {
        proxy_pass      http://%ip%8282;
    }

    location ~ /\.ht    {return 404;}
    location ~ /\.svn/  {return 404;}
    location ~ /\.git/  {return 404;}
    location ~ /\.hg/   {return 404;}
    location ~ /\.bzr/  {return 404;}

    include %home%/%user%/conf/web/%domain%/nginx.conf_*;
}

