class Navbar extends React.Component{


	handleSelection(event){
		event.preventDefault();
		selection = event.target.innerHTML;
		this.props.updatePage(selection);
	}

	render(){
		return(
				<nav id="topNav" className="navbar navbar-default navbar-fixed-top" role="navigation">
					<ul>
						<li><a href="" onClick={this.handleSelection.bind(this)}>Home</a></li>
						<li><a href="" onClick={this.handleSelection.bind(this)}>My Lists</a></li>
						<li><a href="" onClick={this.handleSelection.bind(this)}>Restaurants</a></li>
					</ul>
				</nav>
			)
	}
}
