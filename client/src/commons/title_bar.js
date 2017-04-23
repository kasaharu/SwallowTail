import React from 'react';
import ReactDOM from 'react-dom';
import { AppBar } from 'material-ui';
import { MuiThemeProvider, getMuiTheme } from 'material-ui/styles';
import darkBaseTheme from 'material-ui/styles/baseThemes/darkBaseTheme';

class TitleBar extends React.Component {
  render () {
    return (
      <header>
        <MuiThemeProvider muiTheme={getMuiTheme(darkBaseTheme)}>
          <a href="/">
            <AppBar
              title="SwallowTail"
              showMenuIconButton={false}
            />
          </a>
        </MuiThemeProvider>
      </header>
    );
  }
}

ReactDOM.render(
  <TitleBar />,
  document.getElementById('title_bar')
);
