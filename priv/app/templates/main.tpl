
  <div ng-controller="ControllerMain">

    <!-- ROOT VIEW -->
    <div ui-view></div> 


    <div class="jumbotron alpha">
      <div class="container">
        <h1>{[ 'TITLE' | translate  ]}</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div id="LetUsKnowRow" class="row">
        <div class="col-md-6 alpha">
          <h2>Let us know you are coming!</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-6">

	  <form novalidate class="form-horizontal" role="form">
	    <div class="form-group">
	      <label class="control-label col-sm-4">Your Name:</label>
	      <div class="col-sm-8">          
		<input class="form-control" type="text" ng-model="guest.main" id="main" required="" placeholder="Enter name">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-4">Partner's name:</label>
	      <div class="col-sm-8">          
		<input class="form-control" type="text" ng-model="guest.partner" id="partnername" placeholder="Enter partner's name">
	      </div>
	    </div> 
	    <div class="form-group">
	      <label class="control-label col-sm-4" for="email">Email:</label>
	      <div class="col-sm-8">
		<input type="email" class="form-control" ng-model="guest.email" id="email" required="" placeholder="Enter email">
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-4" for="email">Accomodation</label>
	      <div class="col-sm-8">
		<div class="checkbox">
		  <input type="checkbox" ng-model="guest.accomodation">
		</div>
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-4" for="email">Comments</label>
	      <div class="col-sm-8">
	        <textarea class="form-control" rows="3" ng-model="guest.comments" placeholder="Comments"></textarea>	
	      </div>
	    </div>

	    <div class="form-group">        
	      <div class="col-sm-offset-4 col-sm-8">
		<button type="submit" ng-click="submit(guest)" class="btn btn-default">Submit</button>
	      </div>
	    </div>
	  </form>

       </div>
      </div> <!-- LetUsKNowRow -->


      <hr>


      <div id="ChurchInfoRow" class="row">
        <div class="col-md-6 alpha">
          <h2>The Church</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-3">
          <img src="/app/images/kosciol.jpg" alt="Kosciol NMP we Frysztaku" style="height:300px">
        </div>

        <div class="col-md-3">
	  <form class="form-horizontal" role="form">
	    <div  style="height:300px;" id="church-map-div"></div>
          <form>
       </div>

      </div> <!-- LetUsKNowRow -->



      <!-- FOOTER -->  
      <hr>
      <footer>
        <p>&copy; Company 2014</p>
      </footer>
    </div> <!-- /container -->


  </div>
