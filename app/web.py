# Import the necessary libraries
from flask import Flask, render_template, request

# Initialize the Flask application
app = Flask(__name__)

# Define a route for the home page
@app.route('/')
def home():
    # Render the home page template
    return render_template('home.html')

# Define a route for the mating plan page
@app.route('/mating-plan/<int:plan_id>', methods=['GET', 'POST'])
def mating_plan(plan_id):
    if request.method == 'GET':
        # Retrieve the mating plan data from the RDS database
        mating_plan = get_mating_plan(plan_id)
        
        # Render the mating plan template and pass the mating plan data to it
        return render_template('mating_plan.html', mating_plan=mating_plan)
    elif request.method == 'POST':
        # Update the mating plan data in the RDS database
        updated_plan = {
            'male_dog': request.form['male_dog'],
            'female_dog': request.form['female_dog'],
            'planned_date': request.form['planned_date']
        }
        update_mating_plan(plan_id, updated_plan)
        
        # Redirect to the updated mating plan page
        return redirect(url_for('mating_plan', plan_id=plan_id))

# Define a route for the puppies page
@app.route('/puppies')
def puppies():
    # Retrieve the list of puppies from the RDS database
    puppy_list = get_puppy_list()
    
    # Render the puppies template and pass the list of puppies to it
    return render_template('puppies.html', puppy_list=puppy_list)

# Define a route for the sales history page
@app.route('/sales-history')
def sales_history():
    # Retrieve the sales history from the RDS database
    sale_history = get_sale_history()
    
    # Render the sales history template and pass the sales history data to it
    return render_template('sales_history.html', sale_history=sale_history)

# Run the Flask application
if __name__ == '__main__':
    app.run()
