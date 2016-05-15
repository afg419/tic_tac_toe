var Main = React.createClass({
  getInitialState(){
    debugger
    return {player: this.props.player, game: this.props.game};
  },

  updateGameState(reply){
    this.setState({game: reply});
  },

  render() {
    return (
      <div className="game container">
        <table className="game-board">
          <tbody>
            <tr>
              <td className={"cell-00"}>
                <Cell
                              pos={[0,0]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
              <td className={"cell-01"}>
                <Cell
                              pos={[0,1]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
              <td className={"cell-02"}>
                <Cell
                              pos={[0,2]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
            </tr>
            <tr>
              <td className={"cell-10"}>
                <Cell
                              pos={[1,0]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
              <td className={"cell-11"}>
                <Cell
                              pos={[1,1]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
              <td className={"cell-12"}>
                <Cell
                              pos={[1,2]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
            </tr>
            <tr>
              <td className={"cell-20"}>
                <Cell
                              pos={[2,0]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
              <td className={"cell-21"}>
                <Cell
                              pos={[2,1]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
              <td className={"cell-22"}>
                <Cell
                              pos={[2,2]}
                             game={this.props.game}
                           player={this.state.player}
                  updateGameState={this.updateGameState}
                />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
});
