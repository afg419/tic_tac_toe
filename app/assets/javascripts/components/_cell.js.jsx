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
      return <button className="cell-button move" disabled>{this.cellData()}</button>;
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
          console.log("Failed to make a move");
        }
    });
  },

  makeMoveButton(){
    if(this.props.active){
      return <button className="cell-button make-move" onClick={this.handleMove}>x</button>;
    } else {
      return <button className="cell-button inactive-move" disabled></button>;
    }
  },

  render() {
    return (
      <div>{this.madeMoveOrMakeMove()}</div>
    );
  }
});
