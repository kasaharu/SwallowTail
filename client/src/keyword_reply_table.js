import React from 'react';
import ReactDOM from 'react-dom';
import { MuiThemeProvider } from 'material-ui/styles';
import {
  Table,
  TableBody,
  TableHeader,
  TableHeaderColumn,
  TableRow,
  TableRowColumn
} from 'material-ui/Table';

class KeywordReplyTable extends React.Component {
  propTypes () {
    return {
      keywordReplyList: React.PropTypes.array.isRequired,
    };
  }

  render () {
    return (
      <MuiThemeProvider>
        <Table>
          <TableHeader>
            <Header />
          </TableHeader>
          <TableBody>
            {this.props.keywordReplyList.map((keywordReply) => {
              return (
                <Row
                  keywordReply={keywordReply}
                />
              );
            })}
          </TableBody>
        </Table>
      </MuiThemeProvider>
    );
  }
}

class Header extends React.Component {
  render () {
    return (
      <TableRow>
        <TableHeaderColumn>
          キーワード
        </TableHeaderColumn>
        <TableHeaderColumn>
          応答タイプ
        </TableHeaderColumn>
        <TableHeaderColumn>
          応答メッセージ
        </TableHeaderColumn>
      </TableRow>
    );
  }
}

class Row extends React.Component {
  propTypes() {
    return {
      keywordReply: React.PropTypes.object.isRequired,
    };
  }

  render () {
    return (
      <TableRow>
        <TableRowColumn>
          <a href={`keyword_replies/${this.props.keywordReply.id}`}>
            {this.props.keywordReply.keyword}
          </a>
        </TableRowColumn>
        <TableRowColumn>
          {this.props.keywordReply.reply_type}
        </TableRowColumn>
        <TableRowColumn>
          {this.props.keywordReply.reply_word}
        </TableRowColumn>
      </TableRow>
    );
  }
}

ReactDOM.render(
  <KeywordReplyTable keywordReplyList={keyword_replies} />,
  document.getElementById('keyword_reply_table')
);
