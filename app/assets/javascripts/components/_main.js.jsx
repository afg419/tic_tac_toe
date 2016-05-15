var Main = React.createClass({
  getInitialState(){
    return {player: this.props.player};
  },

  render() {
    return (
      <div className="game container">
        <table className="game-board">
          <tbody>
            <tr>
              <td className={"cell-00"}><Cell pos={[0,0]} player={this.state.player}/></td>
              <td className={"cell-01"}><Cell pos={[0,1]} player={this.state.player}/></td>
              <td className={"cell-02"}><Cell pos={[0,2]} player={this.state.player}/></td>
            </tr>
            <tr>
              <td className={"cell-10"}><Cell pos={[1,0]} player={this.state.player}/></td>
              <td className={"cell-11"}><Cell pos={[1,1]} player={this.state.player}/></td>
              <td className={"cell-12"}><Cell pos={[1,2]} player={this.state.player}/></td>
            </tr>
            <tr>
              <td className={"cell-20"}><Cell pos={[2,0]} player={this.state.player}/></td>
              <td className={"cell-21"}><Cell pos={[2,1]} player={this.state.player}/></td>
              <td className={"cell-22"}><Cell pos={[2,2]} player={this.state.player}/></td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
});
