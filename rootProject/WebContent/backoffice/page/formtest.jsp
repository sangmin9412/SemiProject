<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/backoffice/include/head.jsp" %>
	<div id="wrapper">
		<%@ include file = "/backoffice/include/header.jsp" %>		
		<div id="page-wrapper">
            <div id="page-inner">
				
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                        	Form Test Page
                        </h1>
                        <!-- 
						<ol class="breadcrumb">
						  <li><a href="#">Menu01</a></li>
						  <li><a href="#">Menu02</a></li>
						  <li class="active">Menu03</li>
						</ol>
						 -->
                    </div>
                </div>
                
                <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading"></div>
	                        <div class="panel-body">
	                            <form action="" name="" method="" role="form">
	                                <div class="form-group">
	                                    <label>Text Input</label>
	                                    <input class="form-control">
	                                    <p class="help-block">Example block-level help text here.</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>Text Input with Placeholder</label>
	                                    <input class="form-control" placeholder="Enter text">
	                                </div>
	                                <div class="form-group">
	                                    <label>Static Control</label>
	                                    <p class="form-control-static">email@example.com</p>
	                                </div>
	                                <div class="form-group">
	                                    <label>Checkboxes</label>
	                                    <div class="checkbox">
	                                        <label>
	                                            <input type="checkbox" value="">Checkbox 1
	                                        </label>
	                                    </div>
	                                    <div class="checkbox">
	                                        <label>
	                                            <input type="checkbox" value="">Checkbox 2
	                                        </label>
	                                    </div>
	                                    <div class="checkbox">
	                                        <label>
	                                            <input type="checkbox" value="">Checkbox 3
	                                        </label>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label>Inline Checkboxes</label>
	                                    <label class="checkbox-inline">
	                                        <input type="checkbox">1
	                                    </label>
	                                    <label class="checkbox-inline">
	                                        <input type="checkbox">2
	                                    </label>
	                                    <label class="checkbox-inline">
	                                        <input type="checkbox">3
	                                    </label>
	                                </div>
	                                <div class="form-group">
	                                    <label>Radio Buttons</label>
	                                    <div class="radio">
	                                        <label>
	                                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">Radio 1
	                                        </label>
	                                    </div>
	                                    <div class="radio">
	                                        <label>
	                                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
	                                        </label>
	                                    </div>
	                                    <div class="radio">
	                                        <label>
	                                            <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
	                                        </label>
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label>Inline Radio Buttons</label>
	                                    <label class="radio-inline">
	                                        <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked="">1
	                                    </label>
	                                    <label class="radio-inline">
	                                        <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
	                                    </label>
	                                    <label class="radio-inline">
	                                        <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
	                                    </label>
	                                </div>
	                                <div class="form-group">
	                                    <label>Selects</label>
	                                    <select class="form-control">
	                                        <option>1</option>
	                                        <option>2</option>
	                                        <option>3</option>
	                                        <option>4</option>
	                                        <option>5</option>
	                                    </select>
	                                </div>
	                                <div class="form-group">
	                                    <label>Multiple Selects</label>
	                                    <select multiple="" class="form-control">
	                                        <option>1</option>
	                                        <option>2</option>
	                                        <option>3</option>
	                                        <option>4</option>
	                                        <option>5</option>
	                                    </select>
	                                </div>
	                                <button type="submit" class="btn btn-default">Submit Button</button>
	                                <button type="reset" class="btn btn-default">Reset Button</button>
	                            </form>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
				
				<%@ include file = "/backoffice/include/footer.jsp" %>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
<%@ include file = "/backoffice/include/script.jsp" %>