# ARI3129-SignDetectors-Classifiers

This repository contains the dataset preparation, training, and evaluation scripts for the ARI3129 Group Project: **Automatic Detection & Attribute Classification of Maltese Traffic Signs**.

1.  **Object Detection (Task 2a):** Detecting traffic signs using Faster R-CNN, RF-DETR, SSD/SSDLITE, RetinaNET and YOLO version 8/10/11/12.
2.  **Attribute Classification (Task 2b):** Detecting specific sign attributes, RF-DETR for "Sign Shape" (Circular, Traingular, Square etc.), Yolov12 for "Viewing Angle" (Front, Side and Back), Yolov11 for "Mounting Type" (Pole-Mounted/Wall-Mounted), Yolov8 for "Sign Condition" (Good, Weathered, Heavily Damaged).

---

## Repository Structure

- **`signs_coco/`**: Contains the source images and COCO-format annotations (`result.json`).
- **`signs.json`**: Label Studio export containing specific attribute data (required for Task 2b).
- **`2a_yolov8_zach.ipynb`**: Training pipeline for the standard YOLOv8 object detector.
- **`2a_yolov10_zach.ipynb`**: Comparative training pipeline using the newer YOLOv10 architecture.
- **`2b_signcondition_zach.ipynb`**: Yolov8 pipeline for detecting sign conditions using custom attribute parsing.
- **`2a_Faster_R-CCN_(Francesco).ipynb`** TorchVision Faster R-CNN training and COCOeval-based evaluation pipeline for traffic sign detection, with checkpointing and qualitative prediction visualisations.
- **`2a_Yolov12_(Francesco).ipynb`** Ultralytics YOLOv12 training workflow using YOLO-format labels, validation metrics, and inference visual outputs on held-out images.
- **`2b_ViewingAngle_(Francesco).ipynb`** to train and evaluate a model for classifying traffic sign viewing angle, producing both metrics and example predictions.

---