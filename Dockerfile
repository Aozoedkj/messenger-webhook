# استخدام نسخة PHP الرسمية الخفيفة المخصصة لسكربتات الخلفية
FROM php:8.2-cli

# تثبيت إضافات cURL المهمة للاتصال بـ Facebook API
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    && docker-php-ext-install curl

# تحديد مجلد العمل داخل الحاوية
WORKDIR /usr/src/app

# نسخ ملفات مشروعك بالكامل إلى الحاوية
COPY . .

# الأمر النهائي لتشغيل سكربت البوت المستمر في الخلفية مباشرة
CMD [ "php", "./bot.php" ]
