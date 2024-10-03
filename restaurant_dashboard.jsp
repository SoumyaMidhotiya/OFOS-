<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.ArrayList,models.Taste" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Restaurant Dashboard </title>
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

        <!-- Food Proportion Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="food_proportion.do" id="add_details_from" method="post">
                            <input type="hidden" name="my_food_id" id="my_food_id" value="">
                            <div class="mb-3">
                                <select name="quantity" id="quantity_id">
                                    <option value="0" selected>select-type</option>
                                    <option value="1">Half</option>
                                    <option value="2">Full</option>
                                    <option value="3">Family Pack</option>
                                    <option value="4">None</option>
                                </select>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" name="price" id="price" class="form-control" min="0">
                                </div>
                                <div class="mb-3">
                                    <label for="serve_discription" class="form-label">Serve Discription</label>
                                    <input type="text" name="serve_discription" id="serve_discription"
                                        class="form-control">
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary mt-3" value="save">
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!-- Food Details Modal -->

        <body>
            <div class="modal" id="food_details_modal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content p-5">
                        <div class="modal-header">
                            <h3 class="modal-title">Food Details</h3>
                            <button class="btn btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">

                            <form action="food.do" method="post" id="food_details_form" enctype="multipart/form-data">
                                <input type="hidden" value="" id="food_id" name="food_id">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Food Name</label>
                                    <input type="text" name="name" id="name" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="details" class="form-label">Food Details</label>
                                    <textarea name="details" rows="5" id="details" class="form-control"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="food_image" class="form-label">Food Image File</label>
                                    <input type="file" accept="application/pdf" name="food_image" id="food_image"
                                        class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label for="ingredients" class="form-label">Ingredients</label>
                                    <textarea name="ingredients" rows="5" id="ingredients"
                                        class="form-control"></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="yes" class="me-1">Yes</label><input type="radio" value="true"
                                        name="available" id="yes" class="me-2">
                                    <label for="no" class="me-1">No</label><input type="radio" value="false"
                                        name="available" id="no" class="me-2">
                                </div>

                                <div>
                                    <select name="taste_id">
                                        <c:forEach var="taste" items="${taste}">
                                            <option value="${taste.tasteId}">${taste.type}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div>
                                    <label for="food_type_id" class="form-label">Food Type</label>
                                    <select name="food_type_id" id="food_type_id">
                                        <option value="0" disabled selected>select-type</option>
                                        <option value="1">veg</option>
                                        <option value="2">non-veg</option>
                                        <option value="3">vegan</option>
                                        <option value="4">veg-nonveg</option>
                                        <option value="5">veg-vegan</option>
                                    </select>
                                </div>

                                <input type="submit" class="btn btn-primary mt-3" value="save">
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col">
                        <%@ include file="header.jsp" %>
                    </div>
                </div>

                <div class="row my-4">
                    <div class="col">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                <li class="breadcrumb-item">Restaurant(Dashboard)</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><button data-bs-toggle="tab" data-bs-target="#foods_pane"
                                class="nav-link active">Foods</button></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane show fade active" id="foods_pane">
                            <div class="text-end mt-4 pe-5">
                                <button class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#food_details_modal">&plus; Add Foods</button>
                            </div>

                            <!-- <div class="row justify-content-around mt-3 mb-4">
                        <div class="col-3">
                            <div class="card">
                                <img src="static/media/images/pawar.png" class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title">Pawar Restaurant</h5>
                                    <p class="card-text">Family Restaurant</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img src="static/media/images/badkul.png" class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title">Badkul Restaurant</h5>
                                    <p class="card-text">Pure-Veg Restaurant</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img src="static/media/images/Hera_sweets.png" class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title">Heera Sweets</h5>
                                    <p class="card-text">Misthan Bhandar</p>
                                </div>
                            </div>
                        </div>
                    </div> -->
                        </div>
                    </div>
                </div>
            </div>
            </div>

            <div class="row">
                <div class="col">
                    <div class="tab-content">
                        <c:forEach var="food" items="${foods}" varStatus="recs">
                            <c:if test="${(recs.count-1)%4==0}">
                                <div class="row justify-content-around mt-3">
                            </c:if>
                            <div class="col-3">
                                <div class="card" id="${food.foodId}">
                                    <img src="food_pic.do?food_id=${food.foodId}" class="card-img-top" width="70">
                                    <div class="card-body">
                                        <span class="card-title" style="font-size: 34px;">${food.name}</span>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="add_btn" data-bs-toggle="modal"
                                            data-bs-target="#staticBackdrop">
                                            Add
                                        </button>
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

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

            <Script>
                const cards = document.querySelectorAll('.card-img-top');
                const food_details_form = document.querySelector('#food_details_form');


                const add_btn = document.querySelectorAll('.add_btn');
                let my_food_id = document.querySelector("#my_food_id");

                add_btn.forEach((btn) => {
                    btn.addEventListener('click', (e) => {
                        // console.log(e.target.parentNode.parentNode.id);
                        my_food_id.value = e.target.parentNode.parentNode.id;

                    });
                });


                // const food_id = document.getElementById('#food.food_id');
                // add.addEventListener('click', (e) => {
                //     window.location = e.target.parentNode.parentNode.parentNode.id;
                // });

                // ------------------- save new food --------------------
                food_details_form.addEventListener('submit', (e) => {
                    // e.preventDefault();
                    console.log('hello kaise ho');
                    // food_details_form.submit();
                });

                // ------------------- show new food --------------------
                // cards.forEach((card) => {
                //     card.addEventListener('click', (e) => {
                //         window.location = 'food_details.do';
                //     });
                // });

                // ------------------- show foods -----------------------
                cards.forEach((card) => {
                    card.addEventListener('click', (e) => {
                        // console.log(e.target.parentNode.id);
                        window.location = 'food.do?food_id=' + e.target.parentNode.id;
                    });
                });



            </Script>
        </body>

        </html>