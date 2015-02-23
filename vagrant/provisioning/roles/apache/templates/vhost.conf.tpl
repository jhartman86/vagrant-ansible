<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot {{ httpd_doc_root }}
    ServerName localhost
    ServerAlias *

    SetEnv DATABASE1_NAME {{ database_name }}
    SetEnv DATABASE1_HOST {{ database_host }}
    SetEnv DATABASE1_USER {{ database_user }}
    SetEnv DATABASE1_PASS {{ database_pass }}

    <Directory {{ httpd_doc_root }}>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>