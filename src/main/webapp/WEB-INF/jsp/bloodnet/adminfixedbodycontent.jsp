<%@ page language="java" import="com.taim.conduire.domain.ClientData" %>
<%@ page language="java" import="com.taim.conduire.service.ClientDataService" %>
<%@ page language="java" import="java.util.List" %>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      
    </ul>

    

    
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <p  class="brand-link">
      
      <span class="brand-text font-weight-light"><b>Blood</b>Net</span>
    </p>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/adminlte/dist/img/boxed-bg.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="/shristationery/bloodnet/admin-link?email=${email}" class="d-block"> 
          ${fname} ${lname}
          </a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="/shristationery/bloodnet/admin-home?email=${email}" class="nav-link">
              <p>
                Home
              </p>
            </a>
          </li>
		  <li class="nav-item">
            <a href="/shristationery/bloodnet/admin-notification?email=${email}" class="nav-link">
              <p>
                Notifications
              </p>
            </a>
          </li>
		  <li class="nav-item">
            <a href="/shristationery/bloodnet/admin-gallery?email=${email}" class="nav-link">
              <p>
                Gallery
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/shristationery/bloodnet/admin-post-on-social-platforms?email=${email}" class="nav-link">
              <p>
                Post on Social Platforms
              </p>
            </a>
          </li>
		  <li class="nav-item">
            <a href="/shristationery/bloodnet/admin-hospital-info?email=${email}" class="nav-link">
              <p>
                Hospital Info
              </p>
            </a>
          </li>
		  <li class="nav-item">
            <a href="/shristationery/bloodnet/admin-client-info?email=${email}" class="nav-link">
              <p>
                Client Info
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/shristationery/bloodnet/admin-faq?email=${email}" class="nav-link">
              <p>
                FAQ
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/shristationery/bloodnet/signout" class="nav-link">
              <p>
                Sign Out
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
