//
//  PortfolioView.swift
//  Portfolify
//
//  Created by Ali Tamoor on 23/03/2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject var signUpVM: SignUpViewModel
    @State var reqSize: CGSize = .zero
    @State var url: URL = URL(string: "www.google.com")!
    
    var body: some View {
        PortfolioMain(reqSize: $reqSize)
            .environmentObject(signUpVM)
            .navigationTitle("Portfolio")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                exportToPDF { url in
                    if let url = url {
                        self.url = url
                    }
                }
            }
            .toolbar {
                ShareLink(item: (self.url))
            }
    }
    
    func exportToPDF(completion: @escaping (URL?)  -> Void) {
        let outputFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("\(signUpVM.signUpDataObj.name) - Portfolio.pdf")
        
        var currentView =  PortfolioMain(reqSize: $reqSize).environmentObject(signUpVM)
        let pageSize = CGSize(width: 595, height: reqSize.height + 120)
        
        //View to render on PDF
        
        let myUIHostingController = UIHostingController(rootView: currentView)
        myUIHostingController.view.frame = CGRect(origin: .zero, size: pageSize)
        
        
        //Render the view behind all other views
        guard let rootVC = UIApplication.shared.windows.first?.rootViewController else {
            print("ERROR: Could not find root ViewController.")
            completion(nil)
            return
        }
        rootVC.addChild(myUIHostingController)
        //at: 0 -> draws behind all other views
        //at: UIApplication.shared.windows.count -> draw in front
        rootVC.view.insertSubview(myUIHostingController.view, at: 0)
        
        
        //Render the PDF
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(origin: .zero, size: pageSize))
        DispatchQueue.main.async {
            do {
                try pdfRenderer.writePDF(to: outputFileURL, withActions: { (context) in
                    context.beginPage()
                    myUIHostingController.view.layer.render(in: context.cgContext)
                })
                print("wrote file to: \(outputFileURL.path)")
                completion(outputFileURL)
            } catch {
                print("Could not create PDF file: \(error.localizedDescription)")
                completion(nil)
            }
            
            //Remove rendered view
            myUIHostingController.removeFromParent()
            myUIHostingController.view.removeFromSuperview()
        }
    }
}

struct PortfolioMain: View {
    @StateObject var profileInfoVM = AddInfoViewModel()
    @EnvironmentObject var signUpVM: SignUpViewModel
    @Binding var reqSize: CGSize
    @State private var contentHeight: CGFloat = .zero
    
    var body: some View {
        ScrollView {
            HStack() {
                LeftSideViewPorfolio()
                    .frame(width: UIScreen.main.bounds.size.width * 0.4)
                VStack {
                    Text("\(signUpVM.signUpDataObj.name)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    Text("\(signUpVM.signUpDataObj.about)")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.bottom, 20)
                    
                    ForEach(Categories.allCases, id: \.self) { item in
                        PortfolioSectionSubView(categoryData: profileInfoVM.getDataForCategory(item))
                    }
//                    .frame(width: UIScreen.main.bounds.size.width * 0.65)
                }
                .onAppear {
                    profileInfoVM.loadData()
                }
            }
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: ScrollViewHeightKey.self, value: geometry.size.height)
                }
            )
            .border(Color.black)
        }
        .onPreferenceChange(ScrollViewHeightKey.self) { height in
            self.contentHeight = height
            reqSize.height = self.contentHeight
        }
    }
}

struct ScrollViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}


#Preview {
    LeftSideViewPorfolio()
}



// MARK: -

struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear // we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            size = proxy.size
                        }
                }
            )
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}
