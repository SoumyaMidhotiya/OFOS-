<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    </head>

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

    <body>
        <div class="container">
            <div class="row">
                <div class="col">
                    <%@ include file="header.jsp" %>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="tab-content">
                        <c:forEach var="food" items="${foods}" varStatus="recs">
                            <c:if test="${(recs.count-1)%4==0}">
                                <div class="row justify-content-around mt-3">
                            </c:if>
                            <div class="col-3">
                                <div class="card" id="${food.foodId}" class="${food}">
                                    <img src="food_pic.do?food_id=${food.foodId}" class="card-img-top" height="200">
                                    <div class="card-body">
                                        <h4 class="card-title">${food.name}</h4>
                                        <a class="btn btn-primary btn-lg" id="${food.foodId}" data-bs-toggle="modal"
                                            data-bs-target="#food_pic_box" style="text-decoration: none;">Add</a>
                                            <h4>
                                                <input type="hidden" id="_${recs.count}_ig_${food.foodId}" value="${food.ingredients}">
                                                <input type="hidden" id="_${recs.count}_av_${food.foodId}" value="${food.available}">
                                                <input type="hidden" id="_${recs.count}_tt_${food.foodId}" value="${food.taste.type}">
                                                <input type="hidden" id="_${recs.count}_ig_${food.foodId}" value="${food.foodType.foodType}">
                                            </h4>
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

        <!-- Modal -->
        <div class="modal fade" id="food_pic_box">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row px-5">
                            <div class="col">
                                <div class="row rounded-top bg-secondary text-light justify-content-center py-5">
                                    <div class="col-6 text-center">
                                        <img id="food_pic_img" width="300px" class="mt-2">
                                    </div>
                                    <div class="col-6">
                                        <h2 id="inp_nm">${food.name}</h2>

                                        <p>
                                            <img src="static/media/images/star_rank.png" height="45px">
                                            <span class="fs-5" id="inp_sr">-</span>
                                        </p>

                                        <h3><span>ingredients: </span><span id="inp_ig">-</span></h3>
                                        <h3><span>taste: </span><span id="inp_tt">-</span></h3>
                                        <h3><span>food type: </span><span id="inp_ft">-</span></h3>
                                        <h3><span>available: </span><span id="inp_av">-</span></h3>

                                        <!-- radio button  -->

                                        <div class="row rounded-bottom shadow-bottom bg-secondary px-5 pb-5">
                                            <div class="col-md-9 text-light">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="inlineCheckbox1"
                                                        value="1" name="size">
                                                    <label class="form-check-label" for="inlineCheckbox1">half</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="inlineCheckbox2"
                                                        value="2" name="size">
                                                    <label class="form-check-label" for="inlineCheckbox1">full</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="inlineCheckbox3"
                                                        value="3" name="size">
                                                    <label class="form-check-label"
                                                        for="inlineCheckbox1">family-pack</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="inlineCheckbox4"
                                                        value="4" name="size">
                                                    <label class="form-check-label" for="inlineCheckbox1">none</label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>

        <script>
            const cards = document.querySelectorAll('.card');
            const food_pic_img = document.querySelector('#food_pic_img');
            cards.forEach((card) => {
                card.addEventListener('click', () => {
                    food_pic_img.src = "food_pic.do?food_id=" + card.id;
                });
            });

            // const inp_ig = document.querySelector('#inp_ig');
            // const inp_tt = document.querySelector('#inp_tt');
            // const inp_ft = document.querySelector('#inp_ft');
            // const inp_av = document.querySelector('#inp_av');

            // inp_ig.addEventListener('click',()=>{

            // });

            function getData() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if(this.readyState==4 && this.status==200){
                       document.getElementById('inp_ig').innerHTML = this.responseText;
                    }
                }
            };

            xhttp.open('GET', "all_foods_of_restaurant.jsp", true);
            xhttp.send();
        </script>
    </body>

    </html>