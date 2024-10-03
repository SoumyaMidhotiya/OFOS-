<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

        <style>
            .nav_img {
                max-width: 100%;
                height: auto;
            }

            body {
                background: url(static/media/images/background6.png);
                background-attachment: fixed;
            }

            #box {
                background-color: black;
            }
        </style>

    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="tab-content">
                        <c:forEach var="restaurant" items="${restaurants}" varStatus="recs">
                            <c:if test="${(recs.count-1)%4==0}">
                                <div class="row justify-content-around mt-3">
                            </c:if>
                            <div class="col-3">
                                <div class="card" id="${restaurant.restaurantId}">
                                    <img src="restaurant_pic.do?restaurant_email=${restaurant.email}"
                                        class="card-img-top" width="70">
                                    <div class="card-body">
                                        <h4 class="card-title">${restaurant.name}</h4>
                                        <!-- <h4 class="card-title">${restaurant.restaurantId}</h4> -->
                                    </div>
                                </div>

                            </div>
                            <c:if test="${recs.count%4==0 || record_size==recs.count}">
                    </div>
                    </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>

        <script>
            const cards = document.querySelectorAll('.card');
            cards.forEach((card) =>{
                card.addEventListener('click',e =>{
                    // console.log(e.target.parentNode.id);
                    window.location = "restaurant_food.do?restaurant_id="+e.target.parentNode.id;
                });
            });
        </script>

    </body>

    </html>