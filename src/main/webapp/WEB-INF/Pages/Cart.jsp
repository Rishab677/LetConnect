<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    
    <style>
        body {
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        main {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 20px;
            font-size: 26px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        thead {
            background-color: #eee;
        }
        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .btn {
            padding: 5px 12px;
            border: none;
            background-color: #6b4cc7;
            color: #fff;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #5538a6;
        }
        .qty-box {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        .qty-input {
            width: 40px;
            text-align: center;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
    <script>
        function updateTotalPrice(rowId, price) {
            const qtyInput = document.getElementById("qty" + rowId);
            const qty = parseInt(qtyInput.value);
            const totalField = document.getElementById("total" + rowId);
            totalField.innerText = "Rs. " + (qty * price).toFixed(2);
        }

        function increaseQty(rowId, price) {
            const qtyInput = document.getElementById("qty" + rowId);
            qtyInput.value = parseInt(qtyInput.value) + 1;
            updateTotalPrice(rowId, price);
        }

        function decreaseQty(rowId, price) {
            const qtyInput = document.getElementById("qty" + rowId);
            if (parseInt(qtyInput.value) > 1) {
                qtyInput.value = parseInt(qtyInput.value) - 1;
                updateTotalPrice(rowId, price);
            }
        }
    </script>
</head>
<body>

    <jsp:include page="/WEB-INF/Pages/Header.jsp" />

    <main>
        <h1>Your Cart</h1>

        <c:if test="${not empty message}">
            <p style="color:red;">${message}</p>
        </c:if>

        <c:if test="${not empty cartItems}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartItems}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${item.product.product_name}</td>
                            <td>Rs. ${item.product.price}</td>
                            <td>
                                <div class="qty-box">
                                    <button class="btn" onclick="decreaseQty(${status.index}, ${item.product.price})">−</button>
                                    <input type="text" id="qty${status.index}" class="qty-input" value="${item.quantity}" readonly />
                                    <button class="btn" onclick="increaseQty(${status.index}, ${item.product.price})">+</button>
                                </div>
                            </td>
                            <td id="total${status.index}">
                                Rs. ${item.product.price * item.quantity}
                            </td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/remove-cart-item">
                                    <input type="hidden" name="productId" value="${item.product.id}" />
                                    <button type="submit" class="btn">Remove</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div style="text-align: right; margin-top: 25px;">
                <!-- Checkout Button -->
                <a href="${pageContext.request.contextPath}/checkout" class="btn">Checkout</a>
            </div>
        </c:if>

        <c:if test="${empty cartItems}">
            <p>Your cart is empty.</p>
        </c:if>

        <div style="margin-top: 20px;">
            <a class="btn" href="${pageContext.request.contextPath}/home">Continue Shopping</a>
        </div>
    </main>

    <jsp:include page="/WEB-INF/Pages/Footer.jsp" />
</body>
</html>
