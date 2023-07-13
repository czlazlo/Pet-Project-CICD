import { useState } from 'react';
import Button from './components/Button';
import DatabaseForm from './components/DatabaseForm';
import DeleteForm from './components/DeleteForm';
import './App.css';


function App() {
  const [data, setData] = useState([]);

  return (
    
    <div className="container"> 
      <div className="button-container"> 
        <Button buttonText={"list-users"} url={"/members"} setData={setData}/> 
      </div>

      <div className="table-container"> 
        {data.length > 0 ? (
          <table>
            <thead>
              <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>ID</th>
              </tr>
            </thead>
            <tbody>
              {data.map((item, index) => (
                <tr key={index}>
                  <td>{item.email_address}</td>
                  <td>{item.first_name}</td>
                  <td>{item.last_name}</td>
                  <td>{item.id}</td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : (
          <p>...</p>
        )}
      </div>

      <div className="form-container"> 
        <DatabaseForm url={"/add_user"}></DatabaseForm>
      </div>

      <div className="form-container"> 
        <DeleteForm url={"/delete_user"}></DeleteForm>
      </div>
    </div>
  );
}

export default App;
