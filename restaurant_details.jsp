<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>## OFOS Restaurant Details ##</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

        <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
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
        <!-- ----------------------Modal------------------- -->

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Launch demo modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="logo_upload.do" class="dropzone" id="restaurant_logo"></form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- ----------------------------------------------- -->
        <div class="container">
            <div class="row">
                <div class="col">
                    <%@ include file="header.jsp" %>
                </div>
            </div>

            <form action="resdetails.do" method="post">
                <input type="hidden" name="user_type_id" id="user_type_id" value="${param.user_type_id}">
                <div class="mb-3">
                    <label for="opening_time" class="form-label fs-5 fw-semibold text-primary">Opening_Time</label>
                    <input type="time" class="form-control fs-5" name="opening_time" id="opening_time">
                </div>
                <div class="mb-3">
                    <label for="closing_time" class="form-label fs-5 fw-semibold text-primary">Closing_Time</label>
                    <input type="time" class="form-control fs-5" name="closing_time" id="closing_time">
                </div>
                <div class="mb-3">
                    <label for="details" class="form-label fs-5 fw-semibold text-primary">Details</label>
                    <input type="details" class="form-control fs-5" name="details" id="details">
                </div>
                <div>
                    <input type="submit" class="btn btn-primary btn-lg" id="btn" value="Save">
                </div>

            </form>
        </div>
        </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"> </script>

        <script>
            let success_tick = Document.querySelector('#success_tick');

            DropZone.autoDiscover = false;

            const dropzone = new DropZone('#restaurant_logo', {
                maxFiles: 1,
                maxFileSize: 2,
                acceptedFiles: '.png,.jpg',
                autoProcessQueue: false
            });

            const upload_btn = document.querySelector('#upload_btn');
            upload_btn.addEventListener('click', () => {
                dropzone.processQueue();
            });

            dropzone.on('complete', () => {
                success_tick.classList.replace('d-none', 'd-inline');
            });
        </script>
    </body>

    </html>