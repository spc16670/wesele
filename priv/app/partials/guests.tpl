
  <div class="container top-buffer" ng-controller="ControllerGuests" >
    <div class="row top-buffer">
      <div class="col-md-12 alpha">  
        <table style="width:100%">
          <tr ng-repeat="g in guests">
            <td>{[ g.data.main ]}</td>
            <td>{[ g.data.partner ]}</td> 
            <td>{[ g.data.email ]}</td>
            <td>{[ g.data.accomodation ]}</td>
            <td>{[ g.data.comments ]}</td>
          </tr>
        </table>
      </div>
      <button type="submit" class="btn btn-default" ng-click="getGuests()">Get Guests</button>
    </div><!-- row -->
  </div><!-- navabar -->
