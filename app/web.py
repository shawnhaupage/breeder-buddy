from flask import Flask, render_template, request, redirect, url_for
from database import get_mating_plan, update_mating_plan, get_puppy_list, get_sale_history

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/mating-plan/<int:plan_id>', methods=['GET', 'POST'])
def mating_plan(plan_id):
    if request.method == 'GET':
        mating_plan = get_mating_plan(plan_id)
        return render_template('mating_plan.html', mating_plan=mating_plan)
    elif request.method == 'POST':
        updated_plan = {
            'male_dog': request.form['male_dog'],
            'female_dog': request.form['female_dog'],
            'planned_date': request.form['planned_date']
        }
        update_mating_plan(plan_id, updated_plan)
        return redirect(url_for('mating_plan', plan_id=plan_id))

@app.route('/puppies')
def puppies():
    puppy_list = get_puppy_list()
    return render_template('puppies.html', puppy_list=puppy_list)

@app.route('/sales-history')
def sales_history():
    sale_history = get_sale_history()
    return render_template('sales_history.html', sale_history=sale_history)

if __name__ == '__main__':
    app.run()
