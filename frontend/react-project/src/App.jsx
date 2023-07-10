import { useState } from 'react';
import Button from './components/Button';
import DatabaseForm from './components/DatabaseForm';

function App() {
  const [data, setData] = useState([]);


  

  return <div>
<Button buttonText={"list-users"} url={"/members"} setData={setData}/> 
<div>
  {/* should put this into table a component */}
{data.length > 0 ? (
          <table>
            <thead>
              <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
              </tr>
            </thead>
            <tbody>
              {data.map((item, index) => (
                <tr key={index}>
                  <td>{item.email_address}</td>
                  <td>{item.first_name}</td>
                  <td>{item.last_name}</td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : (
          <p>Loading data...</p>
        )}
  </div> 
<div>
<DatabaseForm url={"/add_user"}></DatabaseForm>
</div> 
<div>
  <Button buttonText={"Delete user by ID"} url={"/delete_user/<id>"} ></Button>
</div>

 </div>
  
}


export default App;
