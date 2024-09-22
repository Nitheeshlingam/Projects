import React from "react";


const UserInput = ({userInputs, onChangeInput}) => {


  return (
    <div id="user-input">
      <div className="input-group">
        <p>
          <label>Initial Investment</label>
          <input
            type="number"
            required
            value={userInputs.initialInvestment}
            onChange={(event) =>
              onChangeInput("initialInvestment", event.target.value)
            }
          />
        </p>
        <p>
          <label>Annual Investment</label>
          <input
            type="number"
            required
            value={userInputs.annualInvestment}
            onChange={(event) =>
              onChangeInput("annualInvestment", event.target.value)
            }
          />
        </p>
      </div>
      <div className="input-group">
        <p>
          <label>Expected Return</label>
          <input
            type="number"
            required
            value={userInputs.expectedReturn}
            onChange={(event) => onChangeInput('expectedReturn',event.target.value)}    
          />
        </p>
        <p>
          <label>Duration</label>
          <input
            type="number"
            required
            value={userInputs.duration}
            onChange={(event) => onChangeInput('expected_Return',event.target.value)}    
          />
        </p>
      </div>
    </div>
  );
};

export default UserInput;
