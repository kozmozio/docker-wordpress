# Docker WordPress Development & Production Environment with Nginx, PHP-fpm, MySQL, Phpmyadmin

Bu Docker Compose konfigürasyonu, WordPress, PHP-fpm, MySQL, Nginx ve PHPMyAdmin'i Docker konteynerleri kullanarak çalıştırmak için bir kurulum sağlar. Geliştirme ve üretim kurulumları için uygundur, aynı zamanda bazı ayarlamalarla üretimde de kullanılabilir.

Docker Compose dosyasındaki servisler şunlardır:

- `db`: MySQL
- `wordpress`: Wordpress
- `nginx`: NGINX Proxy Sunucusu
- `phpmyadmin`: PHPMyAdmin

## Önkoşullar
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Başlarken

1. Bu depoyu klonlayın:

    ```bash
    git clone https://github.com/kozmozio/docker-wordpress.git
    cd your-repository
    ```

2. Gerekli ortam değişkenlerini içeren bir `.env` dosyası oluşturun. Örneğin:

    ```
    NAMESPACE=your_project_name

    MYSQL_DATABASE=your_db_name
    MYSQL_ROOT_PASSWORD=your_root_password
    MYSQL_USER=your_db_user
    MYSQL_PASSWORD=your_db_password

    WORDPRESS_DB_HOST=db
    WORDPRESS_DB_USER=your_wp_user
    WORDPRESS_DB_PASSWORD=your_wp_password
    WORDPRESS_DB_NAME=your_wp_db_name
    WORDPRESS_DEBUG=true
    WORDPRESS_TABLE_PREFIX=wp_
    ```

3. `bash build-dev.sh` dosyası bir kısayol olup Docker imajını oluşturur.

4. `docker-compose.yml` dosyası çoklu konteyner Docker uygulamalarını tanımlamak ve yapılandırmak için kullanılır. Aşağıdaki komutlarla Docker Compose kullanabilirsiniz:

     -  `docker-compose -f docker-compose.yml build`
     -  `docker-compose -f docker-compose.yml up -d`

5. WordPress'e erişim:

    - Domaininizi hosts dosyanıza ekleyin:
      - `sudo pico etc hosts`
      - Ekleyin: `127.0.0.1   docker-wp.local`
    - Tarayıcınızı açın ve http://docker-wp.local adresine gidin.

6. PHPMyAdmin'e erişim:

    - Tarayıcınızı açın ve http://localhost:8000 adresine gidin.
    - `.env` dosyasında belirtilen MySQL kimlik bilgilerini kullanın.

## Ek Yapılandırma

- **.env-sample:**
  - Adını `.env` olarak değiştirip projenin kök dizinine kaydedin.

- **Nginx Yapılandırması:**
  - Nginx yapılandırması `./docker/nginx.conf` dosyasını değiştirerek özelleştirilebilir.

- **Dockerfile:**
  - Barındırma ortamı yapılandırma ve varsayılanları özelleştirin.

- **docker-compose.yml:**
  - Docker Compose dosyasındaki `volumes` bölümünü, WordPress dosyalarınızın bulunduğu dizinleri belirtmek için özelleştirin.

## Servisler
- `db`: MySQL 
- `wordpress`: Wordpress
- `nginx`: NGINX Proxy Sunucusu
- `phpmyadmin`: PHPMyAdmin

## Ağlar
- `docker-wp-net`: Bu, Docker Compose konfigürasyonundaki hizmetler için oluşturulan özel bir ağı temsil eder. Bu ağ, Docker için varsayılan ağ sürücüsü olan `bridge` sürücüsünü kullanır. Bu ağa bağladığınız hizmetler, birbirleriyle iletişim kurabilirler.

## Kullanım

Uygulamayı başlatmak için bu dosyayı içeren dizine gidin ve şu komutu çalıştırın:

`bash build-dev.sh`

## Sorun Giderme

- Sorunlarla karşılaşırsanız, günlükleri kontrol edin:

  ```bash
  docker-compose logs -f
