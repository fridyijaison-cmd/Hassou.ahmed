<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>سوق Hassou</title>
  <style>
    body {
      font-family: Tahoma, Arial, sans-serif;
      background: linear-gradient(to bottom, #d4ed91, #f7f78a);
      margin: 0; padding: 0;
      text-align: center;
    }
    header {
      background: #388e3c;
      color: white;
      padding: 20px;
      font-size: 24px;
      font-weight: bold;
    }
    .product {
      background: white;
      margin: 20px auto;
      padding: 20px;
      width: 90%;
      max-width: 400px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    /* --- تعديل جديد: تنسيق الصور --- */
    .product img {
      max-width: 100%;
      height: auto;
      border-radius: 8px;
      margin-bottom: 15px;
    }
    .product h2 {
      color: #388e3c;
    }
    .btn {
      display: inline-block;
      margin-top: 10px;
      padding: 10px 15px;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: 0.3s;
    }
    .cart-btn {
      background: #ff9800;
      color: white;
    }
    .order-btn {
      background: #388e3c;
      color: white;
    }
    form {
      margin-top: 15px;
      display: none;
    }
    input {
      width: 90%;
      padding: 10px;
      margin: 8px 0;
      border-radius: 6px;
      border: 1px solid #ccc;
    }
  </style>
</head>
<body>
  <header>🛒 سوق Hassou الإلكتروني</header>

  <div class="product">
    <!-- 👇 ضع اسم صورة المنتج الأول هنا 👇 -->
    <img src="images/solar-panel.jpg" alt="لوح طاقة شمسية">
    <h2>لوح طاقة شمسية</h2>
    <p>السعر: 600 درهم</p>
    <button class="btn cart-btn" onclick="showForm('طاقة شمسية')">➕ أضف إلى السلة</button>
  </div>

  <div class="product">
    <!-- 👇 ضع اسم صورة المنتج الثاني هنا 👇 -->
    <img src="images/solar-light.jpg" alt="كشاف شمسي">
    <h2>كشاف شمسي</h2>
    <p>السعر: 700 درهم</p>
    <button class="btn cart-btn" onclick="showForm('كشاف شمسي')">➕ أضف إلى السلة</button>
  </div>

  <div class="product">
    <!-- 👇 ضع اسم صورة المنتج الثالث هنا 👇 -->
    <img src="images/juicer.jpg" alt="عصارة كهربائية">
    <h2>عصارة كهربائية</h2>
    <p>السعر: 189 درهم</p>
    <button class="btn cart-btn" onclick="showForm('عصر كهربائي')">➕ أضف إلى السلة</button>
  </div>

  <form id="orderForm">
    <h3>📋 أرسل معلوماتك للطلب:</h3>
    <input type="text" id="name" placeholder="الاسم الكامل" required><br>
    <input type="text" id="address" placeholder="العنوان" required><br>
    <input type="email" id="email" placeholder="البريد الإلكتروني" required><br>
    <button type="button" class="btn order-btn" onclick="sendOrder()">✅ اطلب الآن</button>
  </form>

  <script>
    let selectedProduct = "";

    function showForm(product) {
      selectedProduct = product;
      document.getElementById("orderForm").style.display = "block";
      window.scrollTo(0, document.body.scrollHeight);
    }

    function sendOrder() {
      const name = document.getElementById("name").value;
      const address = document.getElementById("address").value;
      const email = document.getElementById("email").value;

      if (name && address && email) {
        const phone = "212607072825"; // تأكد من أن هذا هو الرقم الصحيح
        const message = `طلب جديد 🛒%0Aالمنتج: ${selectedProduct}%0Aالاسم: ${name}%0Aالعنوان: ${address}%0Aالبريد: ${email}`;
        const url = `https://wa.me/${phone}?text=${message}`;
        window.open(url, "_blank");
      } else {
        alert("الرجاء إدخال جميع المعلومات!");
      }
    }
  </script>
</body>
</html>
