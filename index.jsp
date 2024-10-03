<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

     <style>
          .nav_img {
               width: 130%;
               height: 213px;
          }

          .nav_imge {
               width: 90%;
               height: 210px;
          }

          body {
               background-image:url("static/media/images/intro.gif"),url("static/media/images/background8.png");
               background-size: 48%,cover;
               background-repeat: no-repeat,no-repeat;
               margin: 10px;
               padding: 25px;
               box-sizing: border-box;
               background-attachment: 0%,fixed;
               background-position:center;
              
               
          }

          a{
               text-align: center;
               font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
               font-size: xx-large;
               font-style: italic;
               color: rgb(202, 236, 13);

          }

          .container {
               margin-top: 10%;
          }
     </style>
</head>
<body>
     <div class="container">
          
          <div class="row justify-content-around mt-5" style="padding: 50px;">
               <div class="col-md-3" style="padding: 10px" >
                    <a href="login.do?user_type_id=1"><img src="static/media/images/vender.gif" class="nav_imge">Vendor</a>
               </div>
               <div class="col-md-3">
                    <a href="login.do?user_type_id=2"><img src="static/media/images/customer2.gif" class="nav_imge">Customer</a>
               </div>
               <div class="col-md-3">
                    <a href="login.do?user_type_id=#"><img src="static/media/images/deliveryboy4.gif" class="nav_img">Deliveryboy</a>
               </div>
          </div>
     </div>
</body>
</html>