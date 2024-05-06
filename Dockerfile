FROM almalinux:9
MAINTAINER Nathanael Noblet <nathanael@noblet.ca>

RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm https://rpms.remirepo.net/enterprise/remi-release-9.rpm && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9 /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9 && \
    dnf config-manager --enable remi && \
    dnf module -y enable php:remi-8.3 && \
    dnf update -y && \
    dnf clean all && \
    rm -rf /var/cache/dnf/*

RUN dnf install -y unzip git php php-gd php-intl php-tidy php-pdo php-cli php-process php-xml php-mysql php-mbstring php-bcmath php-pecl-imagick php-pecl-zip which && \
    rm -rf /var/cache/yum/*

RUN echo 'date.timezone=America/Edmonton' > /etc/php.d/00-docker-php-date-timezone.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
