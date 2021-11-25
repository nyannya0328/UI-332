//
//  Home.swift
//  UI-332 (iOS)
//
//  Created by nyannyan0328 on 2021/10/17.
//

import SwiftUI

struct Home: View {
    @State var showMenu : Bool = false
    @State var animatedPath : Bool = false
    @State var animatedBG : Bool = false
    var body: some View {
        ZStack{
            
            VStack(spacing:15){
                
                HStack{
                    
                    
                    Button {
                        
                        withAnimation{
                            
                            
                            animatedBG.toggle()
                        }
                        
                        withAnimation(.spring()){
                            
                            
                            showMenu.toggle()
                        }
                        
                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3).delay(0.2)){
                            
                       animatedPath.toggle()
                        }
                        
                    } label: {
                        
                        Image("menu")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .shadow(radius: 1)
                            
                    }
                    
                Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Image("add")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            
                    }


                    
                    
                    
                }
                .overlay(
                
                Text("Stories")
                    .font(.title.bold())
                
                )
                .foregroundColor(.white)
                .padding([.horizontal,.top])
                .padding(.bottom,5)
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing:25){
                        
                        
                        ForEach(stories){stories in
                            
                            
                            CardView(story: stories)
                            
                        }
                    }
                    .padding()
                    .padding(.top,10)
                    
                }
               
                
                
                
            }
           
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            
                LinearGradient(colors: [
                    
                    
                        Color("BG1"),
                        Color("BG2"),
                
                
                ], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
            
            
            Color.red
                .opacity(animatedBG ? 0.25 : 0)
                .ignoresSafeArea()
                
            
            
            
            
            MenuView(showMenu: $showMenu, animatedPath: $animatedPath, animatedBG: $animatedBG)
                .offset(x: showMenu ? 0 : -getRect().width)
            
            
            
        }
    }
    @ViewBuilder
    func CardView(story : Story)->some View{
        
        VStack(alignment:.leading,spacing:10){
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                
                Image(story.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
                
            }
            .frame(height: 200)
            
            Text(story.title)
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Button {
                
            } label: {
                
                
                Text("Read Now")
                    .font(.callout.bold())
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(
                    
                    Color("Red")
                        .cornerRadius(10)
                    
                    )
            }
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuView : View{
    
    @Binding var showMenu : Bool
    @Binding var animatedPath : Bool
    @Binding var animatedBG : Bool
    
    
    var body: some View{
        
        ZStack{
            
            
            BlureView(style: .systemUltraThinMaterialDark)
            Color("BG2").opacity(0.6)
                .blur(radius: 15)
            
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.height < 750 ? 20 : 25) {


                Button {
                    
                    withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)){
                        
                        animatedPath.toggle()
                    }

                    
                    withAnimation{
                        
                        
                        animatedBG.toggle()
                    }
                    
                    withAnimation(.spring().delay(0.1)){
                        
                        
                        showMenu.toggle()
                    }
                    
                   
                } label: {


                    Image(systemName: "xmark.circle")
                        .font(.title)
                    
                    
                    


                }
                .foregroundColor(.white)
                
                
                MenuButton(title: "Premium Access", image: "square.grid.2x2", offset: 0)
                    .padding(.top,40)
                
                MenuButton(title: "Upload Content", image: "square.and.arrow.up.fill", offset: 10)
                   
                
                MenuButton(title: "My Account", image: "Profile", offset: 10)
                
                MenuButton(title: "Make Money", image: "dollarsign.circle.fill", offset: 20)
                
                MenuButton(title: "Help", image: "questionmark.app.dashed", offset: 0)
                
                Spacer(minLength: 10)
                
                MenuButton(title: "LogOut", image: "rectangle.portrait.and.arrow.right", offset: 0)

                
                

            }
            .padding(.trailing,120)
            .padding()
            .padding(.top,getSafeArea().top)
            .padding(.bottom,getSafeArea().bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
        }
       
        .clipShape(CustomShape(value: animatedPath ? 150 : 0))
       
        .background(

            CustomShape(value: animatedPath ? 150 : 0)
       
        .stroke(
        
            LinearGradient(colors: [
            
            
            Color("Blue"),
            Color("Blue").opacity(0.7),
            Color("Blue").opacity(0.5),
            Color.clear
            
            ], startPoint: .top, endPoint: .bottom),lineWidth: animatedPath ? 7 : 0
        
        )
        .padding(.leading,-50)

        )
       
        
        .ignoresSafeArea()
    }
    @ViewBuilder
    func MenuButton(title:String,image : String,offset : CGFloat)->some View{
        
        
        Button {
            
        } label: {
            
            let isSmall = UIScreen.main.bounds.height < 750
            
            HStack(spacing: 15){
                
                if image == "Profile"{
                    
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:isSmall ? 42 : 50, height:isSmall ? 42 : 50)
                        .clipShape(Circle())
                    
                }
                else{
                    
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:isSmall ? 22 : 25, height: isSmall ? 22 : 25)
                    
                    
                }
                
                Text(title)
                    .font(.system(size: isSmall ? 15 : 17))
                    .font(title == "LogOut" ? .caption : .footnote)
                    .fontWeight(title == "LogOut" ? .thin : .semibold)
                
            }
            .padding(.vertical)//
            
            
        }
        .foregroundColor(.white)
        .offset(x: offset)

    }
    
}

struct CustomShape : Shape{
    
    var value : CGFloat
    
    var animatableData: CGFloat{

        get{return value}
        set{value = newValue}
    }

    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            let width = rect.width - 100
            let height = rect.height
            
            
            path.move(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            
            path.move(to: CGPoint(x: width, y: 0))
            path.addCurve(to: CGPoint(x: width, y: height + 200), control1: CGPoint(x: width + value, y: height / 3), control2: CGPoint(x: width - value, y: height / 2))
            
        }
    }
}


