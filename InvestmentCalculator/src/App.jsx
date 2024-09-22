import Header from './components/Header'
import UserInput from './components/UserInput'
import Table from './components/Table';
import { useState } from "react";



function App() {
  const [inputs, setInputs] = useState({
    initialInvestment: 10000,
    annualInvestment: 1200,
    expectedReturn: 6,
    duration: 10,
  });
  
  const isValidInput = inputs.duration >=1;
  function handleInputChange(inputIdentifier, newValue) {
    setInputs((prevInputs) => {
      return {
        ...prevInputs,
        [inputIdentifier]: +newValue,
      };
    });
  }
  return (
    <>
    <Header />
    <UserInput onChangeInput={handleInputChange} userInputs={inputs}/>
    {!isValidInput && <p className="center">Please enter a duration greater than zero</p>}
    {isValidInput && <Table input={inputs}/>}
    </>
  )
}

export default App
