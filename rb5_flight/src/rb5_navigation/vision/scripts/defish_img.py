import cv2
import numpy as np


# Monocular Camera Parameters (Manually Tuned)
fx = 329.14904350559868
cx = 315.08231865580137
fy = 325.00990196823267
cy = 245.88442137140748

# fx = 641.0813744041162
# cx = 311.6705550704914
# fy = 638.5575236278869
# cy = 246.2349007877098

# Fisheye Coefficients
k1 = -0.054579686913236417
k2 = 0.020781745571836308
k3 = -0.032857203800441652
k4 = 0.02374005270737352

# k1 = 0.05288773177166605
# k2 = -0.1329252876424239
# k3 = -0.0002621368313884623
# k4 = -0.001353948304334706

# Fisheye Distortion Array
D = np.array([k1, k2, k3, k4])


# RB5 Drone Monocular Intrinsic Matrix
K = np.array([[fx, 0, cx],
              [0, fy, cy],
              [0, 0, 1]])



def defish(img):
    h, w = img.shape[:2]
    # balance = 0.5  # 0.5 preserves more of the image, 0 removes more distortion
    dim = (w, h)
    new_K = cv2.fisheye.estimateNewCameraMatrixForUndistortRectify(K, D, dim, np.eye(3), balance=0)
    map1, map2 = cv2.fisheye.initUndistortRectifyMap(K, D, np.eye(3), new_K, dim, cv2.CV_16SC2)
    undistorted_image = cv2.remap(img, map1, map2, interpolation=cv2.INTER_LINEAR, borderMode=cv2.BORDER_CONSTANT)

    return undistorted_image
# Save the undistorted (desfished) image
    # cv2.imwrite('undistorted_image.jpg', undistorted_image)

    # Display the result
    # cv2.imshow('Desfished Image', undistorted_image)
    
    

# if __name__ == "__main__":
#     IMG_PATH = "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/src/rb5_navigation/vision/img_center/image_006.jpg"
#     image = cv2.imread(IMG_PATH, cv2.IMREAD_GRAYSCALE)
#     cv2.imshow('Defished Image', defish(image)) 
    
#     cv2.waitKey(0)
#     cv2.destroyAllWindows()