<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
    <body>
        <div id="wrapper">
    		<%@ include file="topnavbar.jspf"%>        
            <%@ include file="leftsidemenu.jspf"%>
           
            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Inbox</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 


                        <div class="row">

                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card-box">
                                    <!-- Left sidebar -->
                                    <div class="inbox-leftbar">

                                        <a href="agent/compose" class="btn btn-danger btn-block waves-effect waves-light">Compose</a>

                                        <div class="mail-list mt-4">
                                            <a href="#" class="list-group-item border-0 text-danger font-weight-bold"><i class="mdi mdi-inbox font-18 align-middle mr-2"></i>Inbox<span class="badge badge-danger float-right ml-2 mt-1">8</span></a>
                                            <a href="#" class="list-group-item border-0"><i class="mdi mdi-star font-18 align-middle mr-2"></i>Starred</a>
                                            <a href="#" class="list-group-item border-0"><i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>Draft<span class="badge badge-info float-right ml-2 mt-1">32</span></a>
                                            <a href="#" class="list-group-item border-0"><i class="mdi mdi-send font-18 align-middle mr-2"></i>Sent Mail</a>
                                            <a href="#" class="list-group-item border-0"><i class="mdi mdi-delete font-18 align-middle mr-2"></i>Trash</a>
                                        </div>

                                    </div>
                                    <!-- End Left sidebar -->

                                    <div class="inbox-rightbar">

                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-light waves-effect"><i class="mdi mdi-archive font-18"></i></button>
                                            <button type="button" class="btn btn-sm btn-light waves-effect"><i class="mdi mdi-alert-octagon font-18"></i></button>
                                            <button type="button" class="btn btn-sm btn-light waves-effect"><i class="mdi mdi-delete-variant font-18"></i></button>
                                        </div>
                                       
                                        <div class="mt-4">
                                            <form>
                                                <div class="form-group">
                                                    <input type="email" class="form-control" placeholder="To">
                                                </div>
        
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="Subject">
                                                </div>
                                                <div class="form-group">
                                                    <div class="summernote">
                                                        <h6>Hello Summernote</h6>
                                                        <ul>
                                                            <li>
                                                                Select a text to reveal the toolbar.
                                                            </li>
                                                            <li>
                                                                Edit rich document on-the-fly, so elastic!
                                                            </li>
                                                        </ul>
                                                        <p>
                                                            End of air-mode area
                                                        </p>
        
                                                    </div>
                                                </div>
        
                                                <div class="form-group m-b-0">
                                                    <div class="text-right">
                                                        <button type="button" class="btn btn-success waves-effect waves-light m-r-5"><i class="mdi mdi-content-save-outline"></i></button>
                                                        <button type="button" class="btn btn-success waves-effect waves-light m-r-5"><i class="mdi mdi-delete"></i></button>
                                                        <button class="btn btn-primary waves-effect waves-light"> <span>Send</span> <i class="mdi mdi-send ml-2"></i> </button>
                                                    </div>
                                                </div>
        
                                            </form>
                                        </div> <!-- end card-->
            
                                    </div> 
                                    <!-- end inbox-rightbar-->

                                    <div class="clearfix"></div>
                                </div> <!-- end card-box -->

                            </div> <!-- end Col -->
                        </div><!-- End row -->
                        
                    </div> <!-- container -->

                </div> <!-- content -->
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>    
    	<script>
            jQuery(document).ready(function(){
                $('.summernote').summernote({
                    height: 230,                 // set editor height
                    minHeight: null,             // set minimum height of editor
                    maxHeight: null,             // set maximum height of editor
                    focus: false                 // set focus to editable area after initializing summernote
                });
            });
        </script>
    </body>
</html>