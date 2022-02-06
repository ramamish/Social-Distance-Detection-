## Social-Distance-Detection-
Using ACF detector 

# ACF-Object-detection-Algorithm #

![image](https://user-images.githubusercontent.com/98182482/152291233-1b6cd3c2-90e1-4148-b856-f6f12b2733ca.png)


First, from the input image, ACFs are extracted; based on these features, a multiscale fast feature pyramid is constructed, and then a soft-cascade AdaBoost classifier is used to obtain a series of bounding boxes that may contain objects by sliding-window detection on the feature pyramid. Finally, the most accurate bounding boxes for the objects are located via a postprocessing procedure, i.e., non-maximum suppression (NMS).

![image](https://user-images.githubusercontent.com/98182482/152289924-74716fab-0a59-4e21-b383-a7f80af9cf8c.png)

# Data Set used for pedestrian detection
Computer vision in matlab has already pretrained ACF based people detector trained with caltech pedestrina dataset. So I have used that detector.

Caltech Pedestrian Detection Benchmark
The Caltech Pedestrian Dataset consists of approximately 10 hours of 640x480 30Hz video taken from a vehicle driving through regular traffic in an urban environment. 

Source: This is dataset is from California Institute of technology, Los Angeles, USA.



# Camera View Calibration

The region of interest (ROI) of an image focuses on the pedestrian walking street was transformed into a top-down 2D view that contains 480×480 pixels as shown in Figure 3.4. Camera view calibration is applied which works by computing the transformation of the perspective view into a top-down view. 
In Computer Vision, the perspective transformation is a simple camera calibration method which involves selecting four points in the perspective view and mapping them to the corners of a rectangle in the 2D image view. Hence, every person is assumed to be standing on the same level flat plane. The actual distance between pedestrians corresponds to the number of pixels in the top-down view can be estimated.

![image](https://user-images.githubusercontent.com/98182482/152290596-87067552-5849-40e7-ba12-a09e76a15d16.png)


# Distance Calculation

Once people are detected and bounding boxes are created using computer vision techniques, the task becomes very simple. We just have to calculate the distance between those bounding boxes.
In this step of, the location of the bounding box for each person (x, y, w, h) in the perspective view is detected and transformed into a top-down view. 
For each pedestrian, the position in the top-down view is estimated based on the bottom-center point of the bounding box. 
The distance between every pedestrian pair can be computed from the top-down view and the distances is scaled by the scaling factor estimated from camera view calibration.

Given the position of two pedestrians in an image as (x1, y1) and (x2,y2) respectively, the distance between the two pedestrians, d., can be computed as:
![image](https://user-images.githubusercontent.com/98182482/152290779-591a5450-b2ba-46a4-a79c-a4c1a57c0c72.png)

# Violation Detection

![image](https://user-images.githubusercontent.com/98182482/152290936-5feca048-85ee-4e31-a6b3-c15a76af4de8.png)

As shown in fig , the pair of pedestrians whose distance is below the minimum acceptable distance, t, is marked in red, and the rest is marked in green. A red line is also drawn between the pair of individuals whose distance is below the pre-defined threshold. The bounding box's color threshold operation, c, can be defined as:

![image](https://user-images.githubusercontent.com/98182482/152291011-62dbe0e2-ff71-4bb8-8169-ef77aebfc12a.png)


# Output screenshots

![image](https://user-images.githubusercontent.com/98182482/152291339-54157cdc-76c2-4e52-82b1-6db35d333de5.png)

![image](https://user-images.githubusercontent.com/98182482/152291294-aa550818-c7ae-4b0c-994b-c2c140106b32.png)


# Tools used and input files

I have attached the input video files and I have used Matlab v.2021b for implementing this project.







