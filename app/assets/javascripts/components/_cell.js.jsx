var Cell = React.createClass({
  getInitialState(){
    return {move: 0};
  },


  madeMoveOrMakeMove(){
    if (this.state.move === 0){
      return <div>{this.makeMoveButton()}</div>;
    } else {
      return <div className="move">{this.state.move}</div>;
    }
  },

  handleMove(){
    this.setState({move: this.props.player});
  },

  makeMoveButton(){
    return <button className="make-move" onClick={this.handleMove}>{this.props.player}</button>;
  },

  render() {
    return (
      <div>{this.madeMoveOrMakeMove()}</div>
    );
  }
});
