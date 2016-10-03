class ListContainer extends React.Component{
    constructor(){
      super();
      this.state = { lists: [{
                              title: 'List1',
                              id: 1,
                              order: 1
                              },
                            {
                              title: 'List2',
                              id: 2,
                              order: 2
                            },
                            {
                              title: 'List3',
                              id: 3,
                              order: 3
                            },
                            {
                              title: 'List4',
                              id: 4,
                              order: 4
                            },
                            {
                              title: 'List5',
                              id: 5,
                              order: 5
                            },
                            {
                              title: 'List6',
                              id: 6,
                              order: 6
                            }]
                      }
      this.swapLists = this.swapLists.bind(this)
    }

    compareLists(list1, list2){
      return list1.order - list2.order;
    }

    swapLists(id1, id2) {
      var lists = this.state.lists;

      var list1 = lists.filter(function(l){return l.id === id1})[0];
      var list2 = lists.filter(function(l){return l.id === id2})[0];
      var list1Order = list1.order;
      list1.order = list2.order;
      list2.order = list1Order;

      lists.sort(this.compareLists);

      this.setState({lists: lists});
      console.log(this.state.lists)
    }

  //   componentDidMount(){
  //     url = "/j/lists/" + this.props.url
  //   fetch(url)
  //   .then((response)=> {return(response.json())})
  //   .then((jsonresponse) => {this.setState({lists: jsonresponse.lists})})
  //
  // }

    render(){
      if(this.state.lists.length == null){
        lists = <h3>No Lists</h3>
      }
      else {
          lists = this.state.lists.map((list, i) => {
            return( <List data={list}
                          key={list.id}
                          id={list.id}
                          swapLists ={this.swapLists}
                           /> )
          })
      }
      return(
        <div className="container">
          {lists}
        </div>
      )
    }




}
ListContainer = ReactDnD.DragDropContext(ReactDnDHTML5Backend)(ListContainer);
