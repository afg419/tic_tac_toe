var Cell = React.createClass({
  getInitialState(){
    return {};
  },

  cellData(){
    var board = this.props.game.board;
    var row = this.props.pos[0];
    var col = this.props.pos[1];
    return board[row][col];
  },

  madeMoveOrMakeMove(){
    if (this.cellData() === "empty"){
      return <div>{this.makeMoveButton()}</div>;
    } else {
      return <div className="move">{this.cellData()}</div>;
    }
  },

  handleMove(){
    var gameId = this.props.game.id;
    $.ajax({
        url: '/api/v1/games/' + gameId,
        type: 'PATCH',
        data: { new_move: {pos: this.props.pos, player: this.props.player} },
        success: (reply) => {
          this.props.updateGameState(reply);
          console.log("Made a move");
        },
        error: (error) => {
          debugger
          console.log("Failed to make a move");
        }
    });
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
