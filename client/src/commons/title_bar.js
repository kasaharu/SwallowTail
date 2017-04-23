import React from 'react';
import ReactDOM from 'react-dom';

class TitleBar extends React.Component {
  render () {
    return (
      <header>
        <a href="/">
          SwallowTail
        </a>
      </header>
    );
  }
}

ReactDOM.render(
  <TitleBar />,
  document.getElementById('title_bar')
);
