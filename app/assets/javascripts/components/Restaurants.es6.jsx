class Restaurants extends React.Component {
    constructor(){
      super();
      this.state = {
      		Restaurants: [{
      						Name: "Amir's Sowl Food",
      						Location: "Amir's Basement",
      						id: 1},
      					  {
      					  	Name: "Pure Thai Cookhouse",
      						Location: "Hell's Kitchen",
      						id: 2
      					  }] 
      				}
      }
    componentDidMount(){
    	
    }
	render(){
		return(
		<div className="container">
			<h3>Restaurant Index</h3>
        </div>
        )
	}
}