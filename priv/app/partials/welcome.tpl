

    <div class="jumbotron alpha">
      <div class="container">
        <h3>{[ 'TITLE' | translate  ]}</h3>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div id="LetUsKnowRow" class="row">
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

        <div class="col-md-6 alpha">
          <h2>Let us know you are coming!</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>

      </div> <!-- LetUsKNowRow -->




      <div id="ChurchInfoRow" class="row top-buffer">
        <div class="col-md-6">
	  <form class="form-horizontal" role="form">
	    <div  style="height:300px;" id="church-map-div"></div>
          <form>
        </div>
        <div class="col-md-6 alpha">
          <h2>The Church</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div> <!-- ChurchInfoRow -->




      <div id="ReceptionInfoRow" class="row top-buffer">
        <div class="col-md-6">
	  <form class="form-horizontal" role="form">
	    <div  style="height:300px;" id="reception-map-div"></div>
          <form>
        </div>
        <div class="col-md-6 alpha">
          <h2>The Reception</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>

      </div> <!-- ReceptionInfoRow -->




      <div id="ContactInfoRow" name="contact" class="row top-buffer">
        <div class="col-md-12 alpha">
          <h2>Contact</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>

      </div> <!-- ContactInfoRow -->


      <!-- FOOTER -->  
      <footer>
        <p>&copy; Ionas Software Ltd 2014</p>
      </footer>
    </div> <!-- /container -->


