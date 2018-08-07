library(DataExplorer)
library(sqldf)

#Read in File
MHData <- read.csv("mental-heath-in-tech-2016_20161114.csv", header=TRUE, sep=",")

#Update Column Names
colnames(MHData)[colnames(MHData)=='Are.you.self.employed.'] <- 'SelfEmployed'
colnames(MHData)[colnames(MHData)=='How.many.employees.does.your.company.or.organization.have.'] <- 'CompanySize'
colnames(MHData)[colnames(MHData)=='Is.your.employer.primarily.a.tech.company.organization.'] <- 'TechCompany'
colnames(MHData)[colnames(MHData)=='Is.your.primary.role.within.your.company.related.to.tech.IT.'] <- 'RoleIT'
colnames(MHData)[colnames(MHData)=='Does.your.employer.provide.mental.health.benefits.as.part.of.healthcare.coverage.'] <- 'ProvideMHCoverage'
colnames(MHData)[colnames(MHData)=='Do.you.know.the.options.for.mental.health.care.available.under.your.employer.provided.coverage.'] <- 'AwareOfCoverage'
colnames(MHData)[colnames(MHData)=='Has.your.employer.ever.formally.discussed.mental.health..for.example..as.part.of.a.wellness.campaign.or.other.official.communication..'] <- 'CompanyDiscussMH'
colnames(MHData)[colnames(MHData)=='Does.your.employer.offer.resources.to.learn.more.about.mental.health.concerns.and.options.for.seeking.help.'] <- 'CompanyOfferResources'
colnames(MHData)[colnames(MHData)=='Is.your.anonymity.protected.if.you.choose.to.take.advantage.of.mental.health.or.substance.abuse.treatment.resources.provided.by.your.employer.'] <- 'AnonymityProtected'
colnames(MHData)[colnames(MHData)=='If.a.mental.health.issue.prompted.you.to.request.a.medical.leave.from.work..asking.for.that.leave.would.be.'] <- 'MHPromptedMedLeave'
colnames(MHData)[colnames(MHData)=='Do.you.think.that.discussing.a.mental.health.disorder.with.your.employer.would.have.negative.consequences.'] <- 'DiscussMHCompanyNegative'
colnames(MHData)[colnames(MHData)=='Do.you.think.that.discussing.a.physical.health.issue.with.your.employer.would.have.negative.consequences.'] <- 'DiscussPHCompanyNegative'
colnames(MHData)[colnames(MHData)=='Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers.'] <- 'DiscussMHWithCoWorkers'
colnames(MHData)[colnames(MHData)=='Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s..'] <- 'DiscussMHWithBoss'
colnames(MHData)[colnames(MHData)=='Do.you.feel.that.your.employer.takes.mental.health.as.seriously.as.physical.health.'] <- 'CompanySeriousMHasPH'
colnames(MHData)[colnames(MHData)=='Have.you.heard.of.or.observed.negative.consequences.for.co.workers.who.have.been.open.about.mental.health.issues.in.your.workplace.'] <- 'ObsNegOpenWithMH'
colnames(MHData)[colnames(MHData)=='Do.you.have.medical.coverage..private.insurance.or.state.provided..which.includes.treatment.of.Â.mental.health.issues.'] <- 'MedicalCoverage'
colnames(MHData)[colnames(MHData)=='Do.you.know.local.or.online.resources.to.seek.help.for.a.mental.health.disorder.'] <- 'KnowMHResources'
colnames(MHData)[colnames(MHData)=='If.you.have.been.diagnosed.or.treated.for.a.mental.health.disorder..do.you.ever.reveal.this.to.clients.or.business.contacts.'] <- 'MHDisclosedToClients'
colnames(MHData)[colnames(MHData)=='If.you.have.revealed.a.mental.health.issue.to.a.client.or.business.contact..do.you.believe.this.has.impacted.you.negatively.'] <- 'MHDisclosedToClientsWithNegActions'
colnames(MHData)[colnames(MHData)=='If.you.have.been.diagnosed.or.treated.for.a.mental.health.disorder..do.you.ever.reveal.this.to.coworkers.or.employees.'] <- 'MHDisclosedToCoWorkers'
colnames(MHData)[colnames(MHData)=='If.you.have.revealed.a.mental.health.issue.to.a.coworker.or.employee..do.you.believe.this.has.impacted.you.negatively.'] <- 'MHDisclosedToCoWorkersWithNegActions'
colnames(MHData)[colnames(MHData)=='Do.you.believe.your.productivity.is.ever.affected.by.a.mental.health.issue.'] <- 'MHAffectProductivity'
colnames(MHData)[colnames(MHData)=='If.yes..what.percentage.of.your.work.time..time.performing.primary.or.secondary.job.functions..is.affected.by.a.mental.health.issue.'] <- 'PercWorkAffectedByMH'
colnames(MHData)[colnames(MHData)=='Do.you.have.previous.employers.'] <- 'PrevCo'
colnames(MHData)[colnames(MHData)=='Have.your.previous.employers.provided.mental.health.benefits.'] <- 'PrevCoProvideMH'
colnames(MHData)[colnames(MHData)=='Were.you.aware.of.the.options.for.mental.health.care.provided.by.your.previous.employers.'] <- 'PrevCoAwareMHCoverage'
colnames(MHData)[colnames(MHData)=='Did.your.previous.employers.ever.formally.discuss.mental.health..as.part.of.a.wellness.campaign.or.other.official.communication..'] <- 'PrevCoDiscussMH'
colnames(MHData)[colnames(MHData)=='Did.your.previous.employers.provide.resources.to.learn.more.about.mental.health.issues.and.how.to.seek.help.'] <- 'PrevCoOfferResources'
colnames(MHData)[colnames(MHData)=='Was.your.anonymity.protected.if.you.chose.to.take.advantage.of.mental.health.or.substance.abuse.treatment.resources.with.previous.employers.'] <- 'PrevCoAnonymityProtected'
colnames(MHData)[colnames(MHData)=='Do.you.think.that.discussing.a.mental.health.disorder.with.previous.employers.would.have.negative.consequences.'] <- 'PrevCoDiscussMHCompanyNegative'
colnames(MHData)[colnames(MHData)=='Do.you.think.that.discussing.a.physical.health.issue.with.previous.employers.would.have.negative.consequences.'] <- 'PrevCoDiscussPHCompanyNegative'
colnames(MHData)[colnames(MHData)=='Would.you.have.been.willing.to.discuss.a.mental.health.issue.with.your.previous.co.workers.'] <- 'PrevCoDiscussMHWithCoWorkers'
colnames(MHData)[colnames(MHData)=='Would.you.have.been.willing.to.discuss.a.mental.health.issue.with.your.direct.supervisor.s..'] <- 'PrevCoDiscussMHWithBoss'
colnames(MHData)[colnames(MHData)=='Did.you.feel.that.your.previous.employers.took.mental.health.as.seriously.as.physical.health.'] <- 'PrevCoCompanySeriousMHasPH'
colnames(MHData)[colnames(MHData)=='Did.you.hear.of.or.observe.negative.consequences.for.co.workers.with.mental.health.issues.in.your.previous.workplaces.'] <- 'PrevCoObsNegOpenWithMH'
colnames(MHData)[colnames(MHData)=='Would.you.be.willing.to.bring.up.a.physical.health.issue.with.a.potential.employer.in.an.interview.'] <- 'PotDiscussPH'
colnames(MHData)[colnames(MHData)=='Why.or.why.not.'] <- 'PotDiscussPH_Why'
colnames(MHData)[colnames(MHData)=='Would.you.bring.up.a.mental.health.issue.with.a.potential.employer.in.an.interview.'] <- 'PotDiscussMH'
colnames(MHData)[colnames(MHData)=='Why.or.why.not..1'] <- 'PotDiscussMH_Why'
colnames(MHData)[colnames(MHData)=='Do.you.feel.that.being.identified.as.a.person.with.a.mental.health.issue.would.hurt.your.career.'] <- 'MHHurtCareer'
colnames(MHData)[colnames(MHData)=='Do.you.think.that.team.members.co.workers.would.view.you.more.negatively.if.they.knew.you.suffered.from.a.mental.health.issue.'] <- 'CoWorkersViewYouNegKnewMH'
colnames(MHData)[colnames(MHData)=='How.willing.would.you.be.to.share.with.friends.and.family.that.you.have.a.mental.illness.'] <- 'DiscloseMHFamilyFriends'
colnames(MHData)[colnames(MHData)=='Have.you.observed.or.experienced.an.unsupportive.or.badly.handled.response.to.a.mental.health.issue.in.your.current.or.previous.workplace.'] <- 'NegResponseWithMH'
colnames(MHData)[colnames(MHData)=='Have.your.observations.of.how.another.individual.who.discussed.a.mental.health.disorder.made.you.less.likely.to.reveal.a.mental.health.issue.yourself.in.your.current.workplace.'] <- 'LessLikelyDiscloseMHPreviousEncounter'
colnames(MHData)[colnames(MHData)=='Do.you.have.a.family.history.of.mental.illness.'] <- 'FamilyHistoryMH'
colnames(MHData)[colnames(MHData)=='Have.you.had.a.mental.health.disorder.in.the.past.'] <- 'MHDisorderPast'
colnames(MHData)[colnames(MHData)=='Do.you.currently.have.a.mental.health.disorder.'] <- 'MHCurrently'
colnames(MHData)[colnames(MHData)=='If.yes..what.condition.s..have.you.been.diagnosed.with.'] <- 'MHCurrentlyDiagnosed'
colnames(MHData)[colnames(MHData)=='If.maybe..what.condition.s..do.you.believe.you.have.'] <- 'MHCurrentlyDiagnosedConditions'
colnames(MHData)[colnames(MHData)=='Have.you.been.diagnosed.with.a.mental.health.condition.by.a.medical.professional.'] <- 'MHDiagnosedByDoc'
colnames(MHData)[colnames(MHData)=='If.so..what.condition.s..were.you.diagnosed.with.'] <- 'MHDiagnosedByDoc_Diagnosis'
colnames(MHData)[colnames(MHData)=='Have.you.ever.sought.treatment.for.a.mental.health.issue.from.a.mental.health.professional.'] <- 'MHSoughtTreatment'
colnames(MHData)[colnames(MHData)=='If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively.'] <- 'MHInteferesWhenTreated'
colnames(MHData)[colnames(MHData)=='If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.NOT.being.treated.effectively.'] <- 'MHInteferesWhenNotTreated'
colnames(MHData)[colnames(MHData)=='What.is.your.age.'] <- 'Age'
colnames(MHData)[colnames(MHData)=='What.is.your.gender.'] <- 'Gender'
colnames(MHData)[colnames(MHData)=='What.country.do.you.live.in.'] <- 'Country'
colnames(MHData)[colnames(MHData)=='What.US.state.or.territory.do.you.live.in.'] <- 'State'
colnames(MHData)[colnames(MHData)=='What.country.do.you.work.in.'] <- 'CountryWorkIn'
colnames(MHData)[colnames(MHData)=='What.US.state.or.territory.do.you.work.in.'] <- 'StateWorkIn'
colnames(MHData)[colnames(MHData)=='Which.of.the.following.best.describes.your.work.position.'] <- 'CurrentPosition'
colnames(MHData)[colnames(MHData)=='Do.you.work.remotely.'] <- 'WorkRemotely'

#List Column names
colnames(MHData)

#Graphical representation of missing vaules using 'DataExporer' library
plot_missing(MHData, title = "Percent of Missing Values")

#Function to count all NA's in columns
propmiss <- function(dataframe) {
  m <- sapply(dataframe, function(x) {
    data.frame(
      na_count=sum(is.na(x)),
      Obs=length(x), 
      perc_missing=sum(is.na(x))/length(x)*100
    )
  })
  d <- data.frame(t(m))
  d <- sapply(d, unlist)
  d <- as.data.frame(d)
  d$variable <- row.names(d)
  row.names(d) <- NULL
  d <- cbind(d[ncol(d)],d[-ncol(d)])
  return(d[order(d$na_count, decreasing=TRUE), ])
}

#show results of NA's counted
propmiss(MHData)

#plot_correlation(MHData, maxcat = 5L, use = "pairwise.complete.obs")

MHSUbset <- sqldf("SELECT 
                      SelfEmployed
                      ,ProvideMHCoverage
                      ,AnonymityProtected
                      ,DiscussMHCompanyNegative
                      ,DiscussPHCompanyNegative
                      ,DiscussMHWithBoss
                      ,ObsNegOpenWithMH
                      ,MedicalCoverage
                      ,PercWorkAffectedByMH
                      ,PrevCoAwareMHCoverage
                      ,MHHurtCareer
                      ,CoWorkersViewYouNegKnewMH
                      ,NegResponseWithMH
                      ,MHCurrently
                      ,MHCurrentlyDiagnosed
                      ,Age
                      ,Gender
                      ,State
                      ,CurrentPosition
                      ,WorkRemotely
,case 
when ProvideMHCoverage = 'Not eligible for coverage / N/A' then 0
when ProvideMHCoverage = 'No' then 0
when ProvideMHCoverage = 'Yes' then 1
when ProvideMHCoverage like 'I don' then 2
else NULL 
end as NUM_ProvideMHCoverage

,case 
when AnonymityProtected = 'No' then 0
when AnonymityProtected = 'Yes' then 1
when AnonymityProtected like 'I don' then 2
else NULL 
end as NUM_AnonymityProtected

,case 
when DiscussMHCompanyNegative = 'No' then 0
when DiscussMHCompanyNegative = 'Yes' then 1
when DiscussMHCompanyNegative = 'Maybe' then 2
else NULL 
end as NUM_DiscussMHCompanyNegative

,case 
when DiscussPHCompanyNegative = 'No' then 0
when DiscussPHCompanyNegative = 'Yes' then 1
when DiscussPHCompanyNegative = 'Maybe' then 2
else NULL 
end as NUM_DiscussPHCompanyNegative

,case 
when DiscussMHWithBoss = 'No' then 0
when DiscussMHWithBoss = 'Yes' then 1
when DiscussMHWithBoss = 'Maybe' then 2
else NULL 
end as NUM_DiscussMHWithBoss

,case 
when ObsNegOpenWithMH = 'No' then 0
when ObsNegOpenWithMH = 'Yes' then 1
else NULL 
end as NUM_ObsNegOpenWithMH

,case 
when PercWorkAffectedByMH = '1-25%' then 'Low'
when PercWorkAffectedByMH = '26-50%' then 'Low_to_Medium'
when PercWorkAffectedByMH = '51-75%' then 'Medium'
when PercWorkAffectedByMH = '76-100%' then 'High'
else NULL 
end as CAT_PercWorkAffectedByMH

,case 
when MHHurtCareer = 'Maybe' then 2
when MHHurtCareer = 'No, ' then 0
when MHHurtCareer = 'Yes, ' then 1
else NULL 
end as CAT_MHHurtCareer

,case 
when CoWorkersViewYouNegKnewMH = 'Maybe' then 2
when CoWorkersViewYouNegKnewMH = 'No, ' then 0
when CoWorkersViewYouNegKnewMH = 'Yes, ' then 1
else NULL 
end as NUM_CoWorkersViewYouNegKnewMH

,case 
when MHCurrently = 'Maybe' then 2
when MHCurrently = 'No, ' then 0
when MHCurrently = 'Yes, ' then 1
else NULL 
end as NUM_MHCurrently

,case 
when MHCurrentlyDiagnosed like 'Addictive Disorder' then 'Addiction'
when MHCurrentlyDiagnosed like 'Anxiety' then 'Anxiety'
when MHCurrentlyDiagnosed like 'Attention Def' then 'Attention'
when MHCurrentlyDiagnosed like 'Autism' then 'Autism'
when MHCurrentlyDiagnosed like 'Burn' then 'Burnout'
when MHCurrentlyDiagnosed like 'Combination of physical' then 'Attention'
when MHCurrentlyDiagnosed like 'Depression' then 'Depression'
when MHCurrentlyDiagnosed like 'Eating Disorder' then 'Eating'
when MHCurrentlyDiagnosed like 'I haven' then 'Unknown'
when MHCurrentlyDiagnosed like 'Mood Disorder' then 'Mood'
when MHCurrentlyDiagnosed like 'Obsessive-Compulsive Disorder' then 'Obsessive-Compulsive'
when MHCurrentlyDiagnosed like 'PDD-NOS' then 'PDD-NOS'
when MHCurrentlyDiagnosed like 'Personality Disorder' then 'Personality'
when MHCurrentlyDiagnosed like 'Post-traumatic Stress Disorder' then 'PTSD'
when MHCurrentlyDiagnosed like 'Schizotypal Personality Disorder' then 'Schizotypal'
when MHCurrentlyDiagnosed like 'Seasonal Affective Disorder' then 'Seasonal_Affective'
when MHCurrentlyDiagnosed like 'Sexual addiction' then 'Sexual_Addiction'
when MHCurrentlyDiagnosed like 'Stress Response Syndromes' then 'Stress_Response'
when MHCurrentlyDiagnosed like 'Transgender' then 'Transgender/Mood/Anxiety'
when MHCurrentlyDiagnosed like 'Traumatic Brain Injury' then 'Traumatic_Brain_Injury'
else NULL 
end as CAT_MHCurrentlyDiagnosed

,case
when CurrentPosition = 'Designer' then 'Designer'
when CurrentPosition = 'Support|Designer' then 'Designer'
when CurrentPosition = 'Support|Designer|Front-end Developer' then 'Designer'
when CurrentPosition = 'Back-end Developer' then 'Developer'
when CurrentPosition = 'Other|Back-end Developer' then 'Developer'
when CurrentPosition = 'Support|Back-end Developer' then 'Developer'
when CurrentPosition = 'Support|Front-end Developer|Back-end Developer' then 'Developer'
when CurrentPosition = 'Front-end Developer' then 'Developer'
when CurrentPosition = 'Other|Designer|Front-end Developer' then 'Developer'
when CurrentPosition = 'Other|Front-end Developer' then 'Developer'
when CurrentPosition = 'Dev Evangelist/Advocate' then 'DevEvangelist'
when CurrentPosition = 'Other|Dev Evangelist/Advocate' then 'DevEvangelist'
when CurrentPosition = 'DevOps/SysAdmin' then 'DevOps'
when CurrentPosition = 'Other|DevOps/SysAdmin|Back-end Developer' then 'DevOps'
when CurrentPosition = 'Support|DevOps/SysAdmin' then 'DevOps'
when CurrentPosition = 'Executive Leadership' then 'Exec_Leadership'
when CurrentPosition = 'Other|Executive Leadership' then 'Exec_Leadership'
when CurrentPosition = 'HR' then 'HR'
when CurrentPosition = 'Other|HR' then 'HR'
when CurrentPosition = 'One-person shop' then 'OnePerson'
when CurrentPosition = 'Other|Front-end Developer|Designer|One-person shop' then 'OnePerson'
when CurrentPosition = 'Other|One-person shop' then 'OnePerson'
when CurrentPosition = 'Sales|Support|DevOps/SysAdmin|Executive Leadership' then 'OnePerson'
when CurrentPosition = 'Support|Sales|Back-end Developer|Front-end Developer|Designer|One-person shop' then 'OnePerson'
when CurrentPosition = 'Other' then 'Other'
when CurrentPosition = 'Support|Other' then 'Other'
when CurrentPosition = 'Sales' then 'Sales'
when CurrentPosition = 'Other|Supervisor/Team Lead' then 'Supervisor'
when CurrentPosition = 'Supervisor/Team Lead' then 'Supervisor'
when CurrentPosition = 'Support|HR|Supervisor/Team Lead|Executive Leadership' then 'Supervisor'
when CurrentPosition = 'Other|Support' then 'Support'
when CurrentPosition = 'Support' then 'Support'
end as CAT_CurrentPosition 


FROM MHData")

colnames(MHSUbset)


