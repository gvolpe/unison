{-# LANGUAGE DeriveGeneric #-}

module Unison.Kind where

import GHC.Generics
import Unison.Hashable (Hashable)
import qualified Unison.Hashable as Hashable

data Kind = Star | Arrow Kind Kind deriving (Eq,Ord,Read,Show,Generic)

instance Hashable Kind where
  tokens k = case k of
    Star -> [Hashable.Tag 0]
    Arrow k1 k2 -> (Hashable.Tag 1 : Hashable.tokens k1) ++ Hashable.tokens k2
