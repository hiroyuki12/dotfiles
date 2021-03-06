import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import './style.css';
import Tweet from "./components/Tweet";
import Timeline from "./components/Timeline";

class App extends Component {
  render() {
  const tweets = [
    {
      id: 0,
      icon: '🌽',
      displayName: 'もろこし太郎',
      accountName: 'morokoshi',
      content: '今日も1日もろこしがうまい'
    },
    {
      id: 1,
      icon: '🦐',
      displayName: 'エビデンス',
      accountName: 'evidence',
      content: 'かにみそたべたい'
    }
  ];

    return (
      <div>
        <Timeline tweets={tweets}/>
      </div>
    );
  }
}

export default App;
