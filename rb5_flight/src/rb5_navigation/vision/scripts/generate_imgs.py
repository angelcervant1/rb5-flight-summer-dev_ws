import cv2 as cv
from defish_img import defish
import os

relative_home = "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/src/rb5_navigation/vision/"

folders = [relative_home + "img_center",
           relative_home + "img_left",
           relative_home + "img_right"]

output_folders = [relative_home + "defished_center",
                  relative_home + "defished_left",
                  relative_home + "defished_right"]

def create_imgs_folder(): 
    img_ctr = 0
    
    for index, folder in enumerate(folders):
        if not os.path.exists(output_folders[index]):
                os.makedirs(output_folders[index])
        for img in os.listdir(folder):
            img_path = os.path.join(folder, img)
            image = cv.imread(img_path, cv.IMREAD_GRAYSCALE)
            defished_img = defish(image)
            processed_img_path = os.path.join(output_folders[index],  "processed_{}.png".format(img_ctr))
            cv.imwrite(processed_img_path, defished_img)
            img_ctr += 1

if __name__ == "__main__":
    create_imgs_folder()