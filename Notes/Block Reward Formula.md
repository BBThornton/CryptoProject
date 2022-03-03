# Block Reward Formula
Note Created: 2022-03-03

In case you are not satisfied with CryptoNote default implementation of block reward logic you can also change it. The implementation is in src/CryptoNoteCore/Currency.cpp:
bool Currency::getBlockReward(size_t medianSize, size_t currentBlockSize, uint64_t alreadyGeneratedCoins, uint64_t fee, uint64_t& reward, int64_t& emissionChange) const
This function has two parts:
—basic block reward calculation
uint64_t baseReward = (m_moneySupply - alreadyGeneratedCoins) >> m_emissionSpeedFactor;
—big block penalty calculation
This is the way CryptoNote protects chain from transaction flooding attacks and preserves opportunities for organic network growth at the same time.

Only the first part of this function is directly related to emission logic. You can change it the way you want. See MonetaVerde and DarkNote as the examples where this function is modified.