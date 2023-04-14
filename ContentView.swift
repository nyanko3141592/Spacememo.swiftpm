import RealityKit
import SwiftUI

struct MemoView: View {
    @State var memoText: String = ""
    @State var arViewIsActive: Bool = false
    
    var body: some View {
        VStack {
            TextField("Enter memo text", text: $memoText)
                .padding()
            
            Button("Add Memo in AR Space") {
                arViewIsActive = true
            }
            .padding()
        }
        .sheet(isPresented: $arViewIsActive) {
            ARMemoView(memoText: memoText)
        }
    }
}

struct ARMemoView: View {
    let memoText: String
    
    var body: some View {
        ARViewContainer(memoText: memoText)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    let memoText: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let anchor = AnchorEntity(plane: .horizontal)
        arView.scene.addAnchor(anchor)
        
        let memoEntity = ModelEntity(mesh: MeshResource.generateText(memoText, extrusionDepth: 0.01, font: .systemFont(ofSize: 0.1), containerFrame: CGRect(origin: .zero, size: CGSize(width: 1.0, height: 0.5)), alignment: .center, lineBreakMode: .byCharWrapping), materials: [SimpleMaterial(color: .white, isMetallic: true)])
        memoEntity.position = [0, 0, -0.5]
        anchor.addChild(memoEntity)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        MemoView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
