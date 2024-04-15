//
//  ImageDrag.swift
//  MasteringSwiftUI
//
//  Created by Guy Steinberg on 2024-04-15.
//

import SwiftUI

func imageGen() -> [[DraggableImage]] {
    (1..<4).map { _ in
        (1..<4).map{ _ in DraggableImage(name: NatureImage.allCases.randomElement()!.rawValue)}
    }
}

struct ImageView: View {
    @Binding var image: DraggableImage
    @State var dragAmount = CGSize.zero
    @State var isTapped = false
    
    let returnDuration = 0.3
    
    var isDragging: Bool {
        dragAmount != .zero
    }
    
    var drag: some Gesture {
        DragGesture(coordinateSpace: .global)
            .onChanged { value in
                withAnimation {
                    dragAmount = CGSize(
                        width: value.translation.width,
                        height: value.translation.height)
                    
                    image.zIndex = 1
                }
            }
            .onEnded { _ in
                withAnimation {
                    dragAmount = .zero
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+returnDuration) {
                        image.zIndex = 0.0
                    }
                }
            }
    }
    
    var body: some View {
        Image(image.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
            .padding(10)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(colors: [image.color, .black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    if isDragging {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(image.color, lineWidth: 4)
                            .blur(radius: 5)
                    }
                }
            )
            .opacity(
                isDragging ? 0.8 : 1.0
            )
            .scaleEffect(isDragging ? 1.2 : 1.0)
            .offset(dragAmount)
            .scaleEffect(isTapped ? 1.1 : 1.0)
            .animation(
                .spring(response: 0.4,
                        dampingFraction: 0.6),
                value: isTapped
            )
            .gesture(drag)
            .onTapGesture {
                isTapped = true
                image = DraggableImage(name: NatureImage.allCases.randomElement()!.rawValue)
                
                DispatchQueue.main.asyncAfter(deadline: .now()+returnDuration) {
                    isTapped = false
                }
            }
    }
}

struct ImageDrag: View {
    @State var myImg = DraggableImage(name: NatureImage.img3.rawValue)
    
    var body: some View {
        ZStack {
            Color
                .indigo
                .opacity(0.4)
                .ignoresSafeArea()
            VStack {
                Text("TITITITITITITITIT")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                Spacer()
                ImageView(image: $myImg)
                Spacer()
            }
        }
    }
}

struct GridOfImages: View {
    @State var images = imageGen()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .green, .pink], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Dragging Images!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundStyle(Color.white)
                    .zIndex(100)
                    .shadow(radius: 3)
                Spacer()
                Grid {
                    ForEach(0..<images.count, id: \.self) { i in
                        GridRow {
                            ForEach(0..<images[i].count, id: \.self) { j in
                                ImageView(image: $images[i][j])
                                    .zIndex(images[i][j].zIndex)
                            }
                        }
                    }
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        images = images.shuffled()
                        for i in 0..<images.count {
                            images[i] = images[i].shuffled()
                        }
                    }
                }, label: {
                    Text("Shuffle")
                        .foregroundStyle(Color.cyan)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.black.opacity(0.8))
                        .clipShape(.capsule)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                })
            }.padding()
        }
    }
    
}

#Preview {
    GridOfImages()
}
