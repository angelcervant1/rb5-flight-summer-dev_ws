import cv2 # Import OpenCV
   
# read the image file
img = cv2.imread('/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/src/rb5_navigation/vision/images_captured/image_0006.jpg')
   
ret, bw_img = cv2.threshold(img, 220, 255, cv2.THRESH_BINARY)
   
# converting to its binary form
bw = cv2.threshold(img, 240, 255, cv2.THRESH_BINARY)
  
# Display and save image 
cv2.imshow("Binary", bw_img)
cv2.imwrite("/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/src/rb5_navigation/vision/images_captured/map_from_img2.png", bw_img)
cv2.waitKey(0)
cv2.destroyAllWindows()