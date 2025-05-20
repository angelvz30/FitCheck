//
//  CameraView.swift
//  FitCheck
//
//  Created by Angel Vazquez
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var isShowingCamera:Bool = false
    @State private var takenImage:UIImage?
    var body: some View {
        VStack{
            Text("Take a Picture of Your Clothing Item")
                .font(.largeTitle)
                .padding()
            
            if let image = takenImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipped()
                    .cornerRadius(20)
                    .padding()
            }
            Button(action: {
                isShowingCamera = true
            }) {
                Text("Take Picture")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
            .padding(.bottom)
        }
        .sheet(isPresented: $isShowingCamera) {
            ImagePicker(takenImage: $takenImage)
        }
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var takenImage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context:UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.takenImage = image // add image name
            }
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    
    struct CameraView_Previews: PreviewProvider {
        static var previews: some View {
            CameraView()
        }
    }
}
