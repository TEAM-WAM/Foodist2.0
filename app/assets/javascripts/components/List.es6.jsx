var listSource = {
    beginDrag(props) {
        return { id: props.id };
    }
};

var listTarget = {
    hover(props, monitor) {
        var draggedId = monitor.getItem().id;

        if (draggedId !== props.id) {
            props.swapLists(draggedId, props.id);
        }
    }
};


class List extends React.Component{
  propTypes: {
    connectDragSource: React.PropTypes.func.isRequired,
    connectDropTarget: React.PropTypes.func.isRequired,
    isDragging: React.PropTypes.bool.isRequired,
    id: React.PropTypes.any.isRequired,
    text: React.PropTypes.string.isRequired,
    swapLists: React.PropTypes.func.isRequired
  }

  constructor(){
    super();
    this.state = {
      showChildren: false,
      showEditList: false
    }
    // this.editListTitle = this.editListTitle.bind(this)
    this.toggleEdit = this.toggleEdit.bind(this)
  }

  componentDidMount(){
  }

  toggleChildren(event){
    event.preventDefault();
    this.setState({showChildren: !this.state.showChildren})
  }

  toggleEdit(){
    this.setState({showEditList: !this.state.showEditList})
    if(this.state.showEditList){
      this.refs.listTitle.title.focus()
    }
  }

  // editListTitle(e){
  //   e.preventDefault();
  //   url = "/lists/" +  this.state.currentList.id
  //   $.ajax({
  //     url: url,
  //     type: 'PUT',
  //     data: {list: this.state.currentList,
  //             updating: 'title',
  //             title: this.refs.listTitle.title.value}
  //     }).done((response) => {this.setState({currentList: response})}.bind(this));
  //
  //     this.toggleEdit()
  // }

  render(){
    var style = {
    border: '1px dashed gray',
    padding: '0.5rem 1rem',
    marginBottom: '.5rem',
    backgroundColor: 'white',
    cursor: 'move',
    opacity: this.props.isDragging ? 0 : 1
    };
    var dataId = "restaurants" + this.props.dataId
    var dataIdClass = "#" + dataId
    return this.props.connectDragSource(this.props.connectDropTarget(
      <div style={style} className="row List">
          <div className="row">
            <div className="col-md-8">
              {/* {this.state.showEditList ?
                <h2><strong>
                  <form ref="listTitle" onSubmit={this.editListTitle.bind(this)}>
                    <input type="text" name="title" defaultValue={this.state.currentList.title} onFocusOut={this.toggleChildren.bind(this)}/>
                   </form>
                </strong></h2>
                : */}
                <h2><strong>{this.props.data.title}</strong></h2>
              {/* } */}
            </div>
            <div className="col-md-2">
              <i className="glyphicon glyphicon-edit" onClick={this.toggleEdit}></i>
            </div>
          </div>
          <div className="row">
            <a href={dataIdClass} data-toggle="collapse" onClick={this.toggleChildren.bind(this)} >
              {this.state.showChildren ?
                <i className="glyphicon glyphicon-chevron-up">UP</i> :
                <i className="glyphicon glyphicon-chevron-down">DOWN</i>
              }
            </a>
          </div>
          {this.state.showChildren ?
            <div className="row collapse" id={dataId}>
              <div className="row" id="restaurant_fields">
                  {/* iterate this for field names  */}
                  <div className="col-xs-3">
                    <strong>Restaurant</strong>
                  </div>
                   <div className="col-xs-3">
                    <strong>Cuisine</strong>
                  </div>
                   <div className="col-xs-3">
                    <strong>Location</strong>
                  </div>
                   <div className="col-xs-3">
                    <strong>Visted</strong>
                  </div>

              </div>
              {/* {this.props.data.restaurants.map((list_r, i)=>{
                    return(<ListRestaurant listId={this.props.data.list.id} key={i} dataId={i} data={list_r}/>)
                  })} */}
            </div>
            :
            null
          }
        </div>
    ));
  }
}


var DragSourceDecorator = ReactDnD.DragSource("list", listSource,
    function(connect, monitor) {
        return {
            connectDragSource: connect.dragSource(),
            isDragging: monitor.isDragging()
        };
});

var DropTargetDecorator = ReactDnD.DropTarget("list", listTarget,
    function(connect) {
        return {
            connectDropTarget: connect.dropTarget()
        };
});

List = DropTargetDecorator(DragSourceDecorator(List));
