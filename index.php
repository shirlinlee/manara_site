

<?php include 'header.php';?>

<!-- https://www.manara.asia/tw/ -->
<!--{$smarty.const.ROOT_URLPATH}-->


<div id="container">
    <div id="one_maincolumn" class="main_column">
        <!--   肚子開始  -->


        <!--<link rel="stylesheet" href="-->
        <!--{$smarty.const.ROOT_URLPATH}-->
        <!--user_data/packages/defaultta/css/new_lee.css" /> -->
       
        <div class="banner-slider">
            <div class="mm-tabs-wrapper">
                <div class="tab-item">
                    <ul class="bxslider">                             
                        <li><a href="<!--{$smarty.const.ROOT_URLPATH}-->lp6cg/?utm_source=RU&utm_medium=official_cg&utm_campaign=AAA1705004"><img src="<!--{$smarty.const.ROOT_URLPATH}-->user_data/new/img/banner/manara_1024x522_8.jpg" /></a></li>
                        <li><a href="<!--{$smarty.const.ROOT_URLPATH}-->user_data/regular.php" target="_blank"><img src="<!--{$smarty.const.ROOT_URLPATH}-->user_data/new/img/banner/manara_1024x522_9.jpg" /></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="bg_pink f_white close_parent" >
            <div class="W1280">
                <div id="attention">
                    <h5 class="t_left">緊急異動通知</h5>
                    <p class="t_left">因颱風來襲，9/25停班停課一日，部分地區物流將有所延誤，如造成不便敬請見諒。</p>    
                    <span href="javascript:;" class="close poA f_white">X</span>
                </div>
            </div>
        </div>

        <div id="special" class="W1280 columns-12">
            <h5 class="title">special contents<span class="sub_title">今日のスペシャル</span></h5>
            
            <div class="col-md-6 col-sm-6 col-xs-12">
                <a href="<!--{$smarty.const.ROOT_URLPATH}-->lp6cg/?utm_source=RU&amp;utm_medium=official_cg&amp;utm_campaign=AAA1705004">
                    <img src="<!--{$smarty.const.ROOT_URLPATH}-->user_data/new/img/link-banner-10.jpg" width="100%">
                </a>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <a href="<!--{$smarty.const.ROOT_URLPATH}-->user_data/regular.php" target="_blank">
                <img src="<!--{$smarty.const.ROOT_URLPATH}-->user_data/new/img/link-banner-11.jpg" width="100%">
                </a>
            </div>
        </div>

        <script>
            // $('body').prepend('<div class="bg_pink f_white close_parent" ><div class="W1280"><div id="attention"><h5 class="t_left">緊急異動通知</h5><p class="t_left">因颱風來襲，9/25停班停課一日，部分地區物流將有所延誤，如造成不便敬請見諒。</p>    <span href="javascript:;" class="close poA f_white">X</span></div></div></div>')

            $('body').on('click', '.close', function(){
                $(this).parents('.close_parent').slideUp();
            })
        </script>


        <!--   肚子結束  -->


    </div>
</div>   


<link rel="stylesheet" href="css/new_lee.css" />

<?php include 'footer.php';?> 

