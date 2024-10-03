

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>## OFOS ##</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />


    <style>
        .nav_img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>

<body>

    <!-- ----------------------------------------------------------------- -->
    <div class="modal fade" id="food_pic_box">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Food Pic Upload</h3>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="food_pic.do" class="dropzone" id="food_pic_form">
                        <input type="hidden" name="food_id" value="${food.foodId}">
                    </form>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    <!-- ----------------------------------------------------------------- -->


    <div class="container">
        <div class="row">
            <div class="col">
                <%@ include file="header.jsp" %>
            </div>
        </div>

        <div class="row my-4 px-5">
            <div class="col">
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item">Restaurant(Dashboard)</li>
                        <li class="breadcrumb-item"><a href="restaurant_dashboard.jsp">Food</a></li>
                        <li class="breadcrumb-item">Food Details</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="row px-5">
            <div class="col">
                <div class="row rounded bg-secondary text-light justify-content-center py-5 shadow">
                    <div class="col-3 text-center">
                        <c:choose>
                            <c:when test="${empty food.foodPic}">
                                <!-- <img src="static/media/images/food.png" id="food_pic_img" data-bs-toggle="modal"
                                    data-bs-target="#food_pic_box" width="200" class="mt-2"> -->
                            </c:when>
                            <c:otherwise>
                                <img src="food_pic.do?food_id=${food.foodId}" id="food_pic_img" data-bs-toggle="modal"
                                    data-bs-target="#food_pic_box" width="200" class="mt-2">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-7 pt-2">
                        <h2>${food.name}</h2>
                        <p>
                            <img src="static/media/images/star_rank.png" height="45">
                            <span class="fs-5">${food.rating}</span>
                        </p>

                        <p>
                        <h2><span>ingredients:</span>${food.ingredients}</h2>
                        <h4><span>taste:</span>${food.taste.type}</h4>
                        <h4><span>food-type:</span>${food.foodType.foodType}</h4>
                        <h4><span>available:</span>${food.available}</h4>
                        </p>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-10 p-5">
                        <h2 class="mb-4">Food Details:</h2>
                        <p class="shadow-lg fs-5 p-3 pb-4">${food.details}</p>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const food_pic_img = document.querySelector('#food_pic_img');

            let i = 0;
            const food_pic_box = document.querySelector('#food_pic_box');
            food_pic_box.addEventListener('hidden.bs.modal', event => {
                food_pic_img.src = 'food_pic.do?food_id=' + ${food.foodId} +"&refresh=" + i++;
            });

            const dropzone = new Dropzone('#food_pic_form', {
                addRemoveLinks: true
            });
        </script>
    </div>
</body>

</html>