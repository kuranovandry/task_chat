k41n = User.create!(nickname: 'k41n',
                    password: 'hot3Zoot',
                    password_confirmation: 'hot3Zoot')

Worker.create!(title: 'k41n tasks',
               user: k41n)
