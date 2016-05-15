var Main = React.createClass({
  getInitialState(){
    return {player: this.props.player, game: this.props.game, winningPlayer: this.props.winningPlayer};
  },

  updateGameState(reply){
    this.setState({game: reply.game, winningPlayer: reply.winning_player}, () => {console.log("change state");});
  },

  active(){
    return (this.state.player === this.state.game.current_player);
  },

  newGame(){

  },

  endGameMessage(){
    if (this.state.winningPlayer === "x"){
      return <div>Player X has won! <a href='/play_again'>Play again?</a></div>;
    } else if(this.state.winningPlayer === "o"){
      return <div>Player O has won! <a href='/play_again'>Play again?</a></div>;
    } else if(this.state.winningPlayer === "draw") {
      return <div>Game is a draw! <a href='/play_again'>Play again?</a></div>;
    } else {
      return <div></div>;
    }
  },

  render() {
    return (
      <div className="game container">
        <h3>Current player: {this.state.game.current_player.toUpperCase()}</h3>
        <h3>{this.endGameMessage()}</h3>
        <table className="game-board">
          <tbody>
            <tr>
              <td className={"cell-00"}>
                <Cell
                              pos={[0,0]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
              <td className={"cell-01"}>
                <Cell
                              pos={[0,1]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
              <td className={"cell-02"}>
                <Cell
                              pos={[0,2]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
            </tr>
            <tr>
              <td className={"cell-10"}>
                <Cell
                              pos={[1,0]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
              <td className={"cell-11"}>
                <Cell
                              pos={[1,1]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
              <td className={"cell-12"}>
                <Cell
                              pos={[1,2]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
            </tr>
            <tr>
              <td className={"cell-20"}>
                <Cell
                              pos={[2,0]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
              <td className={"cell-21"}>
                <Cell
                              pos={[2,1]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
              <td className={"cell-22"}>
                <Cell
                              pos={[2,2]}
                             game={this.state.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                           active={this.active()}
                />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
});
