import os
import numpy as np
import pandas as pd
import tensorflow as tf
from PIL import Image
import streamlit as st
import urllib.parse


# uruchamianie
# streamlit run nazwaskryptu

def predict_image(prepared_image):
    with st.spinner('I am predicting...'):
        model = tf.keras.models.load_model('models/model_efnB2_pre_a.h5')
        class_mapping = pd.read_csv('class_report_efB2_kaggle-klasy.csv').set_index('class_id')['class_name'].to_dict()
        data_directory = os.path.join('archive\\', 'internet')

        image_path = os.path.join(data_directory, 'uploaded_image.jpg')
        prepared_image.save(image_path)

        image = tf.keras.preprocessing.image.load_img(image_path, target_size=(224, 224))
        image_array = tf.keras.preprocessing.image.img_to_array(image)
        image_array = np.expand_dims(image_array, axis=0)

        prediction = model.predict(image_array)
        predicted_label = np.argmax(prediction, axis=-1)
        predicted_class = class_mapping[predicted_label[0]]
        probability = prediction[0][predicted_label[0]] 
    st.success('My prediction is completed!')

    return predicted_class, probability


def main():
    st.set_page_config(layout="wide")

    st.title("Save the Birds")
    st.subheader("Quant Squad (jdszr10)")
    mcol1, mcol2 = st.columns([3, 1])
    with mcol1:
        uploaded_image_upload = st.file_uploader("Upload bird's photo", accept_multiple_files=False)

    with mcol2:
        uploaded_image_camera = st.camera_input("Take a picture of the bird")

    if uploaded_image_upload or uploaded_image_camera:
        col1, col2, col3, col4, col5 = st.columns(5)

        if uploaded_image_camera:
            image = Image.open(uploaded_image_camera)
            uploaded_image = uploaded_image_camera
        if uploaded_image_upload:
            image = Image.open(uploaded_image_upload)
            uploaded_image = uploaded_image_upload

        prepared_image = prepare_image(image)

        with col1:
            st.subheader('Original image')
            new_height = 224
            new_width = int(new_height * image.size[0] / image.size[1])
            caption = f"file: {uploaded_image.name}  {image.size[0]}x{image.size[1]} pixels (scaled to {new_width}x{new_height} for display)"
            st.image(image, caption=caption, width=new_width)

        with col2:
            st.subheader('Prepared image')
            caption = (f"{prepared_image.size[0]}x{prepared_image.size[1]} pixels")
            st.image(prepared_image, caption=caption)

        with col3:
            st.subheader('Prediction process')
            predicted_class, probability = predict_image(prepared_image)
            st.subheader(f"Predicted Class:")
            st.subheader(f"{predicted_class}")
            st.subheader(f"Probability: {probability:.2f}")

        with col4:
            st.subheader('Test images')
            if predicted_class:
                image_folder = os.path.join("archive\\test\\", predicted_class)
                image_files = os.listdir(image_folder)
                images = []
                for image_file in image_files:
                    image_path = os.path.join(image_folder, image_file)
                    image = Image.open(image_path)
                    images.append(image)
                st.image(images, caption=image_files, width=150)
            else:
                st.write("No predicted class available.")

        with col5:
            st.subheader('Valid images')
            if predicted_class:
                image_folder = os.path.join("archive\\valid\\", predicted_class)
                image_files = os.listdir(image_folder)
                images = []
                for image_file in image_files:
                    image_path = os.path.join(image_folder, image_file)
                    image = Image.open(image_path)
                    images.append(image)
                st.image(images, caption=image_files, width=150)
            else:
                st.write("No predicted class available.")

def prepare_image(image):
    width, height = image.size
    aspect_ratio = width / height

    if width > height:
        new_width = 224
        new_height = int(new_width / aspect_ratio)
    else:
        new_height = 224
        new_width = int(new_height * aspect_ratio)

    resized_image = image.resize((new_width, new_height), Image.LANCZOS)

    left = (new_width - 224) / 2
    top = (new_height - 224) / 2
    right = (new_width + 224) / 2
    bottom = (new_height + 224) / 2

    prepared_image = resized_image.crop((left, top, right, bottom))
    return prepared_image

if __name__ == "__main__":
    main()
