<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    function openPopup() {
        var popup = window.open("", "PopupForm", "width=400,height=300");
        popup.document.write(`
            <html>
            <head><title>Popup Form</title></head>
            <body>
                <h2>Popup Form</h2>
                <form action="Product" method="post">
                    name: <input type="text" name="name"><br>
                    amount: <input type="text" name="amount"><br>
                    <input type="submit" value="Submit">
                    <file name="productImage" label="Product Image">
                </form>
            </body>
            </html>
        `);
    }
</script>
</head>
<body>

<button onclick="openPopup()">ADD PRODUCT</button>

</body>
</html>
