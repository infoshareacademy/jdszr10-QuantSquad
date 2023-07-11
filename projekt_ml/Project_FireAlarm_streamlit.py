import pandas as pd
import numpy as np
import streamlit as st
from folium.plugins import MarkerCluster
import folium
import pandas as pd
import streamlit as st
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from joblib import load

st.set_page_config(layout="wide", initial_sidebar_state="collapsed",
                   page_title="My App", page_icon=":smiley:")
model = load('/Users/user/Documents/InfoShareAcademy/data_model.joblib')
pca = load('/Users/user/Documents/InfoShareAcademy/data_pca.joblib')
scaler = load('/Users/user/Documents/InfoShareAcademy/data_scaler.joblib')
original_columns = load('/Users/user/Documents/InfoShareAcademy/data_columns.joblib')
global df
df = load('/Users/user/Documents/InfoShareAcademy/data_dataframe_final.joblib')


def main():
    st.title("Fire Alarm Project")

    pages = ["FireAlarm App", "About Model"]
    selected_page = st.sidebar.radio("Navigation", pages)

    if selected_page == "FireAlarm App":
        project_FireAlarm_streamlit()
    elif selected_page == "About Model":
        display_about_model_page()


# ---------------------------------------------------------------


def get_prediction(user_input):
    global df
    user_input_df = pd.DataFrame([user_input])
    user_input_encoded = pd.get_dummies(user_input_df)
    missing_columns = list(set(original_columns) -
                           set(user_input_encoded.columns))
    missing_columns_df = pd.DataFrame(
        0, index=user_input_encoded.index, columns=missing_columns)
    user_input_encoded = pd.concat(
        [user_input_encoded, missing_columns_df], axis=1)
    user_input_encoded = user_input_encoded[original_columns]
    user_input_scaled = scaler.transform(user_input_encoded)
    user_input_pca = pca.transform(user_input_scaled)
    prediction = model.predict(user_input_pca)
    return prediction


def project_FireAlarm_streamlit():
    global df
    st.header("FireAlarm App")

    col1, col2, col3 = st.columns(3)
    with col1:
        st.subheader('Fire location')

        Area_of_Origin_values = np.sort(df['Area_of_Origin'].unique(
        ))
        Area_of_Origin_undetermined_index = Area_of_Origin_values.tolist(
        ).index('Undetermined  (formerly 98)')
        Area_of_Origin = st.selectbox(
            'Area of Origin:', Area_of_Origin_values, index=Area_of_Origin_undetermined_index)

        Extent_Of_Fire_values = np.sort(df['Extent_Of_Fire'].unique())
        Extent_Of_Fire_undetermined_index = Extent_Of_Fire_values.tolist(
        ).index('Undetermined')
        Extent_Of_Fire = st.selectbox(
            'Extent Of Fire:', Extent_Of_Fire_values, index=Extent_Of_Fire_undetermined_index)
        Property_Use_values = np.sort(df['Property_Use'].unique(
        ))
        Property_Use_undetermined_index = Property_Use_values.tolist(
        ).index('Multi-Unit Dwelling - Over 12 Units')
        Property_Use = st.selectbox(
            'Property Use:', Property_Use_values, index=Property_Use_undetermined_index)

    with col2:
        st.subheader('Source of fire')

        Ignition_Source_values = np.sort(df['Ignition_Source'].unique(
        ))
        Ignition_Source_undetermined_index = Ignition_Source_values.tolist(
        ).index('Undetermined')
        Ignition_Source = st.selectbox(
            'Ignition Source:', Ignition_Source_values, index=Ignition_Source_undetermined_index)

        Material_First_Ignited_values = np.sort(df['Material_First_Ignited'].unique(
        ))
        Material_First_Ignited_undetermined_index = Material_First_Ignited_values.tolist(
        ).index('Undetermined (formerly 98)')
        Material_First_Ignited = st.selectbox(
            'Material First Ignited:', Material_First_Ignited_values, index=Material_First_Ignited_undetermined_index)

        Possible_Cause_values = np.sort(df['Possible_Cause'].unique(
        ))
        Possible_Cause_undetermined_index = Possible_Cause_values.tolist(
        ).index('Undetermined')
        Possible_Cause = st.selectbox(
            'Possible Cause:', Possible_Cause_values, index=Possible_Cause_undetermined_index)

    with col3:
        st.subheader('Alarm')
        Fire_Alarm_System_Impact_on_Evacuation_values = np.sort(df['Fire_Alarm_System_Impact_on_Evacuation'].unique(
        ))
        Fire_Alarm_System_Impact_on_Evacuation_undetermined_index = Fire_Alarm_System_Impact_on_Evacuation_values.tolist(
        ).index('Undetermined')
        Fire_Alarm_System_Impact_on_Evacuation = st.selectbox(
            'Fire Alarm System Impact on Evacuation:', Fire_Alarm_System_Impact_on_Evacuation_values, index=Fire_Alarm_System_Impact_on_Evacuation_undetermined_index)
        Fire_Alarm_System_Operation_values = np.sort(df['Fire_Alarm_System_Operation'].unique(
        ))
        Fire_Alarm_System_Operation_undetermined_index = Fire_Alarm_System_Operation_values.tolist(
        ).index('Fire alarm system operation undetermined')
        Fire_Alarm_System_Operation = st.selectbox(
            'Fire Alarm System Operation:', Fire_Alarm_System_Operation_values, index=Fire_Alarm_System_Operation_undetermined_index)

        Fire_Alarm_System_Presence_values = np.sort(df['Fire_Alarm_System_Presence'].unique(
        ))
        Fire_Alarm_System_Presence_undetermined_index = Fire_Alarm_System_Presence_values.tolist(
        ).index('Undetermined')
        Fire_Alarm_System_Presence = st.selectbox(
            'Fire Alarm System Presence:', Fire_Alarm_System_Presence_values, index=Fire_Alarm_System_Presence_undetermined_index)

    if st.button('Predict'):

        data = {
            'Attribute': ['Area_of_Origin', 'Extent_Of_Fire', 'Fire_Alarm_System_Impact_on_Evacuation',
                          'Fire_Alarm_System_Operation', 'Fire_Alarm_System_Presence', 'Ignition_Source',
                          'Material_First_Ignited', 'Possible_Cause', 'Property_Use'],
            'value': [Area_of_Origin, Extent_Of_Fire, Fire_Alarm_System_Impact_on_Evacuation,
                      Fire_Alarm_System_Operation, Fire_Alarm_System_Presence, Ignition_Source,
                      Material_First_Ignited, Possible_Cause, Property_Use]
        }
        df = pd.DataFrame(data)

        user_input = {}
        user_input['Area_of_Origin'] = Area_of_Origin
        user_input['Extent_Of_Fire'] = Extent_Of_Fire
        user_input['Fire_Alarm_System_Impact_on_Evacuation'] = Fire_Alarm_System_Impact_on_Evacuation
        user_input['Fire_Alarm_System_Operation'] = Fire_Alarm_System_Operation
        user_input['Fire_Alarm_System_Presence'] = Fire_Alarm_System_Presence
        user_input['Ignition_Source'] = Ignition_Source
        user_input['Material_First_Ignited'] = Material_First_Ignited
        user_input['Possible_Cause'] = Possible_Cause
        user_input['Property_Use'] = Property_Use

        prediction = get_prediction(user_input)
        if prediction > 0:
            st.error('Based on the gathered information, there is a high probability of injured individuals. **We recommend calling an ambulance**.', icon="🚨")
        else:
            st.warning('Based on the collected information, we have not identified a high probability of injured individuals. However, it is possible that due to incomplete information, our prediction may be incorrect', icon="⚠️")

        with st.expander("See Fire parameters details"):
            st.subheader("Fire parameters")
            st.table(df)

    if st.button('Predict (Scenario 1)'):

        user_input = {}
        user_input['Area_of_Origin'] = 'Hallway, Corridor'
        user_input['Extent_Of_Fire'] = 'Spread beyond room of origin, same floor'
        user_input['Fire_Alarm_System_Impact_on_Evacuation'] = 'All persons (at risk of injury) evacuated as a result of hearing fire alarm system'
        user_input['Fire_Alarm_System_Operation'] = 'Fire alarm system operated'
        user_input['Fire_Alarm_System_Presence'] = 'Fire alarm system present'
        user_input['Ignition_Source'] = 'Undetermined'
        user_input['Material_First_Ignited'] = 'Upholstered Sofa, Chair, etc.'
        user_input['Possible_Cause'] = 'Undetermined'
        user_input['Property_Use'] = 'Multi-Unit Dwelling - Over 12 Units'

        data = {
            'Attribute': ['Area_of_Origin', 'Extent_Of_Fire', 'Fire_Alarm_System_Impact_on_Evacuation',
                          'Fire_Alarm_System_Operation', 'Fire_Alarm_System_Presence', 'Ignition_Source',
                          'Material_First_Ignited', 'Possible_Cause', 'Property_Use'],
            'value': [user_input['Area_of_Origin'], user_input['Extent_Of_Fire'], user_input['Fire_Alarm_System_Impact_on_Evacuation'],
                      user_input['Fire_Alarm_System_Operation'], user_input['Fire_Alarm_System_Presence'], user_input['Ignition_Source'],
                      user_input['Material_First_Ignited'], user_input['Possible_Cause'], user_input['Property_Use']]
        }
        df = pd.DataFrame(data)

        prediction = get_prediction(user_input)
        col11, col12 = st.columns(2)
        with col11:
            if prediction > 0:
                st.error(
                    "Based on the gathered information, there is a high probability of injured individuals. \n**We recommend calling an ambulance**.", icon="🚨")
            else:
                st.warning('Based on the collected information, we have not identified a high probability of injured individuals. However, it is possible that due to incomplete information, our prediction may be incorrect', icon="⚠️")
        with col12:
            with st.expander("See Fire parameters details", expanded=True):
                st.subheader("Fire parameters")
                st.table(df)

    if st.button('Predict (Scenario 2)'):

        user_input = {}
        user_input['Area_of_Origin'] = 'Cooking Area or Kitchen'
        user_input['Extent_Of_Fire'] = 'Spread to other floors, confined to building'
        user_input[
            'Fire_Alarm_System_Impact_on_Evacuation'] = 'Not applicable: Occupant(s) first alerted by other means'
        user_input['Fire_Alarm_System_Operation'] = 'Fire alarm system did not operate'
        user_input['Fire_Alarm_System_Presence'] = 'Fire alarm system present'
        user_input['Ignition_Source'] = 'Undetermined'
        user_input['Material_First_Ignited'] = 'Undetermined (formerly 98)'
        user_input['Possible_Cause'] = 'Undetermined'
        user_input['Property_Use'] = 'Multi-Unit Dwelling - Over 12 Units'

        data = {
            'Attribute': ['Area_of_Origin', 'Extent_Of_Fire', 'Fire_Alarm_System_Impact_on_Evacuation',
                          'Fire_Alarm_System_Operation', 'Fire_Alarm_System_Presence', 'Ignition_Source',
                          'Material_First_Ignited', 'Possible_Cause', 'Property_Use'],
            'value': [user_input['Area_of_Origin'], user_input['Extent_Of_Fire'], user_input['Fire_Alarm_System_Impact_on_Evacuation'],
                      user_input['Fire_Alarm_System_Operation'], user_input['Fire_Alarm_System_Presence'], user_input['Ignition_Source'],
                      user_input['Material_First_Ignited'], user_input['Possible_Cause'], user_input['Property_Use']]
        }
        df = pd.DataFrame(data)

        prediction = get_prediction(user_input)

        col21, col22 = st.columns(2)
        with col21:
            if prediction > 0:
                st.error(
                    'Based on the gathered information, there is a high probability of injured individuals. **We recommend calling an ambulance**.', icon="🚨")
            else:
                st.warning('Based on the collected information, we have not identified a high probability of injured individuals. However, it is possible that due to incomplete information, our prediction may be incorrect', icon="⚠️")
        with col22:
            with st.expander("See Fire parameters details", expanded=True):
                st.subheader("Fire parameters")
                st.table(df)


def display_about_model_page():
    st.header("About Model")
    params_df = pd.DataFrame.from_dict(
        model.get_params(), orient='index', columns=['Value'])
    params_df = params_df.dropna(subset=['Value'])
    st.table(params_df)


# ==========================================================
if __name__ == "__main__":
    main()
