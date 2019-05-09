defmodule ParserTest do
  use ExUnit.Case, async: true

  test "parse job" do
    {:ok, file} = File.read("test/ressources/job.html")
    job_map = %{content: nil, tag_id: nil, title: nil, url: nil}
    {_html, result} = WtjScrapper.Parser.parse_job(file, job_map)

    assert result == %{
             content:
               "About\nMeero’s core mission is to empower photographers to focus on what they love: photography! We take care of the rest by relying on tech and AI.\nWe are a 3 year old company with already over 540 employees and offices in Paris, NYC, Shanghai, Tokyo, Bangalore, and Sydney, and planning to count over 1000 staff members by the end of 2019. Come and join us!\nWe opened new offices in Paris in January 2019, 4000m2 filled with plants and light. They are just waiting for you ;-)\nStarted in 2016, Meero allows the 31,000 brands we work with to book photoshoots in the blink of an eye anywhere in the world and have them delivered back fully-edited and ready to use 24 hours later. This is possible thanks to the community of 52,000 photographers that trust and our cutting-edge technology capable of processing photoshoots in a few seconds, when currently a 60 minute photo shoot requires several hours of editing.\nDiscover Meero\nDiscover\n \nMeero\nJob description\nWHAT YOU'LL DO\nWe are currently looking for a engineer in computer vision to join our highly skilled and benevolent R&D team, who develops large-scale image processing and deep learning algorithms to enhance the quality of our professional photos the same way as a human editor would do, with their knowledge of aesthetics and sensibility.\nYou will be part of a 20+ family of Computer Vision & Deep learning researchers and engineers, working on the whole photo acquisition-to-edition pipeline and beyond, from HDR to 3D modeling.\n\nYou should be able to work on complex problems both in autonomy and as part of a team, hands-on solving day-to-day the challenges of the other Meero teams. Your main soft skills will be a balance between fast-pace reasoning and coding and patience for solving the problem you work on, the ability to re-question and re-work from scratch your work until it performs well from low-maturity research to off-the-shelf development, and the spirit of teamwork, creating value in the group.\nPreferred experience\nWHAT YOU'LL NEED\nCoding skill in Python ideally also TensorFlow and shell scripting\nGood core knowledge of computer vision and image processing algorithms ; deep learning\nGood experience with Linux \nVery good computer science skills\nThe ability to clearly communicate complex ideas, both to technical colleagues and non-technical audiences\nThe ability to generate creative ideas and beautiful solutions to real-world problems, based on a deep understanding of the problem domain\nWHAT  WE WOULD LOVE\nYou have an interest for photography, beautiful images, visual arts...\nYou care about your teammates, such as… bringing cookies at work ;)\nYou have experience with real-time vision applications and/or embedded applications.\nWORK @ MEERO\nOur five commandments represent what we do, who we are\nWe are Fam:\n what's the point spending all these hours together if we don't have fun?\nLoyalty matters:\n we care about Meero. We are building something meaningful together.\nGo fast and Break things:\n we work quickly.\nGive a Shit:\n details matter, damn it.\nThink BIG:\n each one of us has to always shoot for bigger, faster, better. Always...\nRecruitment process\nRECRUITMENT PROCESS\nHR interview with the Talent team\nInterview with the hiring manager of this offer, followed by the COO.\nWelcome on board !\nMeet the \nMeero\n team",
             tag_id: nil,
             title: "Python Software Engineer // Computer Vision   ",
             url: nil
           }
  end

  test "parse links" do
    {:ok, file} = File.read("test/ressources/links.html")
    result = WtjScrapper.Parser.get_links(file)

    assert result == [
             "https://www.welcometothejungle.co/fr/companies/meero/jobs/computer-vision-engineer-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/botify/jobs/python-engineer-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/365talents/jobs/python-data-engineer_lyon",
             "https://www.welcometothejungle.co/fr/companies/walnut-algorithms/jobs/python-developer_paris",
             "https://www.welcometothejungle.co/fr/companies/tinyclues/jobs/python-technical-leader-machine-learning-stack_paris",
             "https://www.welcometothejungle.co/fr/companies/dxomark/jobs/senior-python-developer-audio-team_boulogne-billancourt",
             "https://www.welcometothejungle.co/fr/companies/toucan-toco/jobs/developpeur-se-python-appetence-front_paris",
             "https://www.welcometothejungle.co/fr/companies/outscale/jobs/developpeur-python-back-end-f-h_saint-cloud",
             "https://www.welcometothejungle.co/fr/companies/budget-insight/jobs/developpeur-python-scraping-h-f_paris_BI_jloVJkJ",
             "https://www.welcometothejungle.co/fr/companies/habx/jobs/developpeur-python-algorithmes-et-backend_paris",
             "https://www.welcometothejungle.co/fr/companies/margo/jobs/developpeur-python-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/sewan/jobs/developpeur-python-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/bruce/jobs/developpeur-python-growth-hacker-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/invivoo/jobs/developpeur-python-h-f_courbevoie_INVIV_qZy5aeV",
             "https://www.welcometothejungle.co/fr/companies/data-impact/jobs/developpeur-python-stage_paris",
             "https://www.welcometothejungle.co/fr/companies/onepoint/jobs/developpeur-python-h-f_paris_ONEPO_Zkrkb2r",
             "https://www.welcometothejungle.co/fr/companies/softbank-robotics-europe/jobs/backend-python-engineer-w-m_paris-15e-arrondissement",
             "https://www.welcometothejungle.co/fr/companies/pricing-assistant/jobs/developpeur-python-data-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/nextmind/jobs/ingenieur-developpement-python-cdi-f-h_paris",
             "https://www.welcometothejungle.co/fr/companies/onogone/jobs/ingenieur-python-et-big-data-developpeur-back-end_paris",
             "https://www.welcometothejungle.co/fr/companies/onepoint/jobs/developpeur-python-h-f_nantes_ONEPO_QWKj38l",
             "https://www.welcometothejungle.co/fr/companies/budget-insight/jobs/stagiaire-developpeur-python-scraping-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/meilleursagents/jobs/developpeur-backend-confirme-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/toucan-toco/jobs/software-engineer-python-trajectoire-full-stack_paris",
             "https://www.welcometothejungle.co/fr/companies/deepki/jobs/data-engineer_paris",
             "https://www.welcometothejungle.co/fr/companies/manomano/jobs/lead-dev-python-serverless-h-f_paris",
             "https://www.welcometothejungle.co/fr/companies/capital-fund-management/jobs/ingenieur-developpement-python-middle-office_paris",
             "https://www.welcometothejungle.co/fr/companies/padam/jobs/developpeur-python_paris",
             "https://www.welcometothejungle.co/fr/companies/paylead/jobs/backend-developer-python_paris",
             "https://www.welcometothejungle.co/fr/companies/gymglish/jobs/full-stack-python-developer_paris"
           ]
  end
end
