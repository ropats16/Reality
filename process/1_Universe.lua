VerseInfo = {
  Parent = 'SingularityProcessId',
  Name = 'Universe',
  Dimensions = 1,
  ['Render-With'] = '1D-Directory',
}

VerseParameters = {}

VerseEntities = {
  ['WeaveWorldProcessId'] = {
    Position = { 0 },
  }
}

-- TODO: "Boost" handler (Burn $wAR to boost a verse)

-- TODO: Cron handler to recalcuate positions based on exponential decay (?) of Boost history
-- As an optimisation, you could create a single exponential using which updates based on
-- (Not sure how to construct this formula)