import { useState } from 'react';

export default function Player({initialName, symbol, isActive, onChangeName}){
    const[playerName,setPlayerName]= useState(initialName);
    const [isEditing, setIsEditing] = useState(false);

    let editablePlayerName = (
        <span className="player-name">{playerName}</span>
    )
    let Option = "Edit";

    function handleChange(event){
        console.log(event);
        setPlayerName(event.target.value);
    }

    if(isEditing){
        editablePlayerName = (<input type="text" required value={playerName} onChange={handleChange}/>)
        Option = "Save";
    }

    function handleEditClick(){
        setIsEditing(editing => !editing);
        if(isEditing){
            onChangeName(symbol,playerName);
        }
    }

    return(
        <li className={isActive ? "active": undefined}>
            <span className="player">
                {editablePlayerName}
            <span className="player-symbol">{symbol}</span>
            </span>
            <button onClick={handleEditClick}>{Option}</button>
        </li>
    );
}