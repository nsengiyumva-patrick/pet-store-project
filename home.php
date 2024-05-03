 <!-- Header-->
 <header class="bg-dark py-5" id="main-header">
    <div class="container px-4 px-lg-5 my-5 mt-3">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder"><br></h1>
            <p class="lead fw-normal text-white-50 mb-0"><br><br></p>
        </div>
    </div>
</header><br>
<div class="d-flex justify-content-center">
   <div class="shop">
     <h2 class="head2">Shop</h2>
      <h1>latest collection</h1>
    <p>Check out our latest collection of products. <br>We regularly update our inventory with new and exciting items to provide you with the best selection</p>
   </div>
</div>
   
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <?php 
                $products = $conn->query("SELECT * FROM `products` where status = 1 order by rand() limit 8 ");
                while($row = $products->fetch_assoc()):
                    $upload_path = base_app.'/uploads/product_'.$row['id'];
                    $img = "";
                    if(is_dir($upload_path)){
                        $fileO = scandir($upload_path);
                        if(isset($fileO[2]))
                            $img = "uploads/product_".$row['id']."/".$fileO[2];
                        // var_dump($fileO);
                    }
                    $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
                    $inv = array();
                    while($ir = $inventory->fetch_assoc()){
                        $inv[$ir['size']] = number_format($ir['price']);
                    }
            ?>
            <div class="col col-sm-6 col-lg-4 mb-5">
                <div class="product-card">
                    <div class="badge">Hot</div>
                    <div class="product-tumb">
                        <img src="<?php echo validate_image($img) ?>" alt="">
                    </div>
                    <div class="product-details">
                        <h4><a href=".?p=view_product&id=<?php echo md5($row['id']) ?>"><?php echo $row['product_name'] ?></a></h4>
                        <?php foreach($inv as $k=> $v): ?>
                        <div class="product-bottom-details">
                            <div class="product-price"><?php echo $k ?>: </b><?php echo $v ?></div>
                            <?php endforeach; ?>
                            <div class="product-links">
                                <a href=""><i class="fa fa-heart"></i></a>
                                <a href=".?p=view_product&id=<?php echo md5($row['id']) ?>"><i class="fa fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <?php endwhile; ?>
                        </div>
                        </div>
</section>