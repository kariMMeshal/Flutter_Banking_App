  Map<String, dynamic> getPlanDetails(String title) {
    switch (title.toLowerCase()) {
      case "extreme mode":
        return {
          "subtitle": "Push Your Limits! 🚀",
          "saving": "60%",
          "investment": "20%",
          "spoiled": "10%",
          "needs": "10%",
          "details":
              "🔥 This plan is for those who maximize financial growth. Extreme savings, high investment, and minimum luxury spending."
        };
      case "best mode":
        return {
          "subtitle": "Achieve Perfection! 🎯",
          "saving": "50%",
          "investment": "25%",
          "spoiled": "12.5%",
          "needs": "12.5%",
          "details":
              "🎯 A balanced lifestyle where savings and investments are prioritized while leaving room for enjoyment."
        };
      case "spoiled mode":
        return {
          "subtitle": "Enjoy Life! 💸",
          "saving": "15%",
          "investment": "15%",
          "spoiled": "50%",
          "needs": "20%",
          "details":
              "💸 This plan is for those who prioritize luxury and enjoyment while keeping some savings and investments."
        };
      default:
        return {
          "subtitle": "Custom Plan ✨",
          "saving": "40%",
          "investment": "30%",
          "spoiled": "20%",
          "needs": "10%",
          "details":
              "🚀 A flexible plan that balances savings, investments, and lifestyle spending."
        };
    }
  }