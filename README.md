NSMutilItemLayoutConstraint
===========================

constraintsWithVisualFormat of NSLayoutConstraint class only support one visual format, here extending the NSLayoutConstraint make it can process more than one visual formats, its usage like this"@"|-[firstButton]-[secondButton]-|,V:|-[firstButton],[firstButton(secondButton)]"",with comma separate different visual format, as you see this has stronger expression. and also improve  efficiency