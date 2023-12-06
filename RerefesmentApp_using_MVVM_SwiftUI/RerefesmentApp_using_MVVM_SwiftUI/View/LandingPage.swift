//
//  LandingPage.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 15/09/2023.
//

import SwiftUI

struct LandingPage: View {
    @Binding var selectedCategory: Category
    @State var menuOpen: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        if !self.menuOpen {
                            Button(action: {
                                self.openMenu()
                            }, label: {
                                Constants.getHamburgerMenuIcon()
                                    .font(.title)
                                    .padding(10)
                                    .background(Color.pink.opacity(0.12))
                                    .foregroundColor(Color.pink)
                                    .cornerRadius(8)
                            })
                        }
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Constants.getProfileImage()
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(10)
                                .background(Color.black.opacity(0.08))
                                .foregroundColor(Color.pink)
                                .cornerRadius(8)
                        })
                    }
                    .overlay {
                        Text(Constants.homeNavTitle)
                    }
                    .padding()
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                VStack(alignment: .leading, spacing: 12, content: {
                                    ( Constants.getPosterTitle() )
                                        .fontWeight(.bold)
                                        .font(.title2)
                                    
                                    Button(action: {}, label: {
                                        Text(Constants.orderNowButtonTitle)
                                            .font(.footnote)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal)
                                            .background(Color.pink)
                                            .clipShape(Capsule())
                                    })
                                })
                                .padding(.leading)
                                Constants.getPosterBikeImage()
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: getRect().width / 3)
                            }
                            .padding()
                            .background(Color.yellow.opacity(0.35))
                            .cornerRadius(15)
                            .padding(.horizontal)
                            
                            // Categories View
                            Text(Constants.categoryHeader)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                
                                HStack {
                                    ForEach(categories) { category in
                                        HStack {
                                            Image(category.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 25, height: 25)
                                                .padding(6)
                                                .background(selectedCategory.id == category.id ?  Color.white : Color.clear)
                                                .clipShape(Circle())
                                            
                                            Text(category.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(selectedCategory.id == category.id ? .white : .black)
                                        }
                                        .padding(.vertical, 12)
                                        .padding(.horizontal)
                                        .background(selectedCategory.id == category.id ? Color.pink : Color.gray.opacity(0.09))
                                        .clipShape(Capsule())
                                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                selectedCategory = category
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            })
                            
                            HStack {
                                Text(Constants.popularHeader)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                NavigationLink(destination: AllProducts()) {
                                    HStack(spacing: 8) {
                                        Text(Constants.viewAllLabel)
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .foregroundColor(.pink)
                                        
                                        Constants.getRightChevron()
                                            .font(.footnote)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 4)
                                            .padding(.horizontal, 6)
                                            .background(.pink)
                                            .cornerRadius(5)
                                    }
                                }
                            }
                            .padding()
                            .padding(.top, 10)
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                
                                HStack(spacing: 25) {
                                    ForEach(popularItems) { item in
                                        NavigationLink(destination: ProductDetail(item: item)) {
                                            PopularItemsRowVIew(item: item)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding()
                                .padding(.leading, 10)
                            })
                        }.padding()
                    })
                }
                .background(Color.black.opacity(0.03).ignoresSafeArea())
                
                SideMenu(width: 270,
                         isOpen: self.menuOpen,
                         menuClose: self.openMenu)
            }
        }
    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
