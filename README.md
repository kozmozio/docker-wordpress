
# Dockerized WordPress Setup

This Docker Compose configuration provides a setup for running WordPress, MySQL, Nginx, and PHPMyAdmin using Docker containers.

Build for easy development setups, also possible to use in production with some tweaks.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone this repository:

    ```bash
    git clone https://github.com/your-username/your-repository.git
    cd your-repository
    ```

2. Create a `.env` file with the required environment variables:

    ```dotenv
    MYSQL_DATABASE=your_db_name
    MYSQL_ROOT_PASSWORD=your_root_password
    MYSQL_USER=your_db_user
    MYSQL_PASSWORD=your_db_password

    WORDPRESS_DB_HOST=db
    WORDPRESS_DB_USER=your_wp_user
    WORDPRESS_DB_PASSWORD=your_wp_password
    WORDPRESS_DB_NAME=your_wp_db_name

    NAMESPACE=your_project_name
    ```

 3. `bash build-dev.sh` file is a shortcut 
 3. `docker-compose.yml` file is used to define, configure, and run  multi-container Docker applications.
 
     -  `docker-compose -f docker-compose.yml build`
     -  `docker-compose -f docker-compose.yml up -d` 

4. Access WordPress:

    - Open your browser and navigate to http://docker-wp.local

5. Access PHPMyAdmin:

    - Open your browser and navigate to http://localhost:8000
    - Use the MySQL credentials specified in the `.env` file.

## Additional Configuration

- **Nginx Configuration:**
  - Nginx configuration can be customized by modifying `./docker/nginx.conf`.

## Troubleshooting

- If you encounter issues, check the logs:
  ```bash
  docker-compose logs -f




### Services
- `db`: MySQL 

- `wordpress` : Wordpress

- `nginx`: NGINX Proxy Server

### Networks
- `docker-wp-net`: This is a custom network created for the services in this Docker Compose configuration. It uses the `bridge` driver, which is the default network driver for Docker. If you connect any services to this network, they will be able to communicate with each other.

## Usage

To start the application, navigate to the directory containing this file and run:

`bash build-dev.sh`

