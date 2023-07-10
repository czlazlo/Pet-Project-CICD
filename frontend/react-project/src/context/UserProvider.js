import React, { createContext, useState } from 'react';

const UserContext = createContext(undefined);

const UserProvider = ({ children }) => {
  const [user, setUser] = useState({});

  const userContextValue = {
    user,
    setUser,
  };

  return (
    <UserContext.Provider value={userContextValue}>
      {children}
    </UserContext.Provider>
  );
};
