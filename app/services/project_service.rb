class ProjectService
  def fetch_projects
    
    [
      {
        title: "SpiderVerse landingPage",
        description: I18n.t("projects.items.SpiderVerse.description"),
        stack: ["HTML", "tailwind"],
        repo_url: "https://spider-verse-landing.vercel.app/", 
        thumbnail: "tumbnail_spider.png",
        color: "bg-red-900",
        icon: "atom"
      },
      {
        title: "CyberWeb",
        description: I18n.t("projects.items.cyberweb.description"),
        stack: ["Vite", "React", "Typescript"],
        repo_url: "https://cyber-site-two.vercel.app/",
        thumbnail: "tumbnail_cyber.png",
        color: "bg-purple-900",
        icon: "zap"
      },
      {
        title: "ComplexCalculator",
        description: I18n.t("projects.items.calculator.description"),
        stack: ["Vite", "React", "Tailwind", "AI"],
        repo_url: "https://calculadora-eight-lake.vercel.app/",
        thumbnail: "tumbnail_calculator.png",
        color: "bg-slate-900",
        icon: "triangle"
      },
      {
        title: "IMC Calculator",
        description: I18n.t("projects.items.imc.description"),
        stack: ["Vite", "React", "tailwind"],
        repo_url: "https://imc-calculator-three-fawn.vercel.app/",
        thumbnail: "tumbnail_imc.png",
        color: "bg-emerald-900",
        icon: "layout-dashboard"
      }
    ]
  end
end
