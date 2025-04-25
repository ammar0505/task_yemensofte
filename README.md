# تطبيق إدارة الطلبات

## نظرة عامة
هذا التطبيق هو نظام لإدارة الطلبات باستخدام Flutter، يعتمد على نمط Clean Architecture مع استخدام Bloc Pattern لإدارة الحالة.

## التصميم العام

### 1. هيكل المشروع
```
lib/
├── core/
│   ├── constants/
│   ├── database/
│   ├── utils/
│   └── widgets/
├── features/
│   └── order_feature/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
└── main.dart
```

### 2. المكونات الرئيسية

#### 2.1. Core Layer
- **Database**: استخدام SQLite للتخزين المحلي
- **Utils**: أدوات مساعدة مثل InactivityTimer
- **Widgets**: مكونات واجهة المستخدم المشتركة

#### 2.2. Features Layer
- **Data Layer**: 
  - Models: نماذج البيانات
  - Repositories: تنفيذ واجهات المستودعات
  - DataSources: مصادر البيانات المحلية والبعيدة

- **Domain Layer**:
  - Entities: كيانات العمل
  - Repositories: واجهات المستودعات
  - UseCases: حالات الاستخدام

- **Presentation Layer**:
  - Bloc: إدارة حالة التطبيق
  - Pages: شاشات التطبيق
  - Widgets: مكونات واجهة المستخدم الخاصة بالشاشات

## القرارات البرمجية

### 1. إدارة الحالة
- استخدام Bloc Pattern لإدارة حالة التطبيق
- فصل منطق الأعمال عن واجهة المستخدم
- استخدام Cubit للشاشات البسيطة و Bloc للشاشات المعقدة

### 2. التخزين المحلي
- استخدام SQLite للتخزين المحلي
- تنفيذ نمط Repository للفصل بين منطق التخزين والتطبيق
- تخزين البيانات في جدول واحد مع علامة معالجة للتمييز بين الطلبات المعالجة وغير المعالجة

### 3. إدارة الجلسة
- تنفيذ نظام مراقبة النشاط
- إعادة التوجيه إلى شاشة تسجيل الدخول بعد 2 دقيقة من عدم النشاط
- مراقبة حالة التطبيق (في المقدمة/الخلفية)

### 4. واجهة المستخدم
- استخدام Material Design
- تنفيذ Pull-to-Refresh للطلبات
- تصميم متجاوب يعمل على مختلف أحجام الشاشات

### 5. الأمان
- تخزين البيانات الحساسة بشكل آمن
- التحقق من صلاحية الجلسة
- إدارة حالة عدم النشاط

## التقنيات المستخدمة
- Flutter SDK
- Bloc Pattern
- SQLite
- Material Design
- Clean Architecture
