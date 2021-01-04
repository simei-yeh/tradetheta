import React, { useState } from 'react'
import './GraphOptions.css'

const GraphOptions = () => {
  const timeOptions = ['5min', '15min', '30min', 'daily', 'weekly']


  return (
    <div className="options-bar-wrapper">
      {timeOptions.map(d => <button key={d}>{d}</button>)}
    </div>
  );
}


export default GraphOptions;