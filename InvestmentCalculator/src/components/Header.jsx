import React from "react";
import logo from "/investment-calculator-logo.png";
import Input from "./UserInput";
const Header = () => {
  return (
    <header id="header">
      <img src={logo} alt="investment-logo" />
      <h1>Investment Calculator</h1>
    </header>
  );
};

export default Header;
