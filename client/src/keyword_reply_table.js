import React from 'react';
import ReactDOM from 'react-dom';

class KeywordReplyTable extends React.Component {
  propTypes () {
    return {
      keywordReplyList: React.PropTypes.array.isRequired,
    };
  }

  render () {
    return (
      <table>
        <Header />
        {this.props.keywordReplyList.map((keywordReply) => {
          return (
            <Row
              keywordReply={keywordReply}
            />
          );
        })}
      </table>
    );
  }
}

class Header extends React.Component {
  render () {
    return (
      <tr>
        <th>
          キーワード
        </th>
        <th>
          応答タイプ
        </th>
        <th>
          応答メッセージ
        </th>
      </tr>
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
      <tr>
        <td>
          {this.props.keywordReply.keyword}
        </td>
        <td>
          {this.props.keywordReply.reply_type}
        </td>
        <td>
          {this.props.keywordReply.reply_word}
        </td>
      </tr>
    );
  }
}

ReactDOM.render(
  <KeywordReplyTable keywordReplyList={keyword_replies} />,
  document.getElementById('keyword_reply_table')
);
