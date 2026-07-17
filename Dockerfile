# استخدام نسخة PHP الرسمية مع سيرفر Apache المدمج
FROM php:8.2-apache

# تفعيل مود إعادة الكتابة (Rewrite Module) وهو مهم للـ Webhooks
RUN a2enmod rewrite

# نسخ جميع ملفات مشروعك إلى مجلد السيرفر الافتراضي
COPY . /var/www/html/

# تغيير الصلاحيات لتشغيل الملفات بأمان
RUN chown -W www-data:www-data /var/www/html

# فتح المنفذ 80 (وهو المنفذ الافتراضي الذي سيتحدث معه Render)
EXPOSE 80
