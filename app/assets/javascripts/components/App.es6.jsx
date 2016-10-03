class App extends React.Component{
	constructor(){
		super();
		this.state = {
			currentPage: 'Home'
		}
		this.updatePage = this.updatePage.bind(this)
	}

	updatePage(selectedPage){
		this.setState({currentPage: selectedPage})
	}

	render(){
		if (this.state.currentPage == 'Home'){
			content = <ListContainer />
		} else if (this.state.currentPage == 'Restaurants') {
			content = <Restaurants />
		} else if (this.state.currentPage == 'My Lists') {
			content = <ListContainer />
		}

		return(
			<div className='App'>
				<Navbar updatePage={this.updatePage}/> 
				{content}
			</div>
			)
	}
}