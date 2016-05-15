var Cell = React.createClass({

  // madeMoveOrMakeMove(){
  //
  // },

  makeMoveButton(){
    return <button onClick={this.handleMove}>{this.props.player}</button>;
  },

  render() {
    return (
      <div>{this.props.pos} {this.makeMoveButton()}</div>
    );
  }
});
