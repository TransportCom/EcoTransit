import SwiftUI

struct  WelcomeSwipeView: View {
    private let views: [AnyView] = [
        AnyView(Driver()),
        AnyView(Location()),
        AnyView(TrackYourRide())
    ]

    @State private var currentPage = 0

    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                ForEach(0..<views.count, id: \.self) { index in
                    views[index]
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            

           
        }.navigationBarBackButtonHidden(true)
    }
}
  



struct WelcomeSwipeView_previews: PreviewProvider {
    static var previews: some View {
        WelcomeSwipeView()
    }
}





