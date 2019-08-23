{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Petitions.Data (
  Petition,
  Petition'(..),

  PetitionLocale,
  PetitionLocale'(..),

  Signer,
  Signer'(..),

  SignerAgg,
  SignerAgg'(..),
  )  where

import GHC.Generics
import Data.Aeson
import Data.Text

-- ** Petition

data Petition' a b c d e f = Petition { 
    _petitionId          :: a,
    _petitionCode        :: b,
    _petitionName        :: c,
    _petitionDescription :: d,
    _petitionContent     :: e,
    _petitionLocale      :: f
} deriving Generic
type Petition = Petition' Int Text Text Text Text Text

deriving instance Show Petition
deriving instance Eq Petition
instance ToJSON   Petition
instance FromJSON Petition

-- ** PetitionLocale

data PetitionLocale' a b c d e f = PetitionLocale { 
    _petitionLocaleId          :: a,
    _petitionLocaleName        :: b,
    _petitionLocaleDescription :: c,
    _petitionLocaleContent     :: d,
    _petitionLocaleLocale      :: e,
    _petitionLocalePetitionId  :: f
} deriving Generic
type PetitionLocale = PetitionLocale' Int Text Text Text Text Int

deriving instance Show PetitionLocale
deriving instance Eq PetitionLocale
instance ToJSON   PetitionLocale
instance FromJSON PetitionLocale

-- ** Signer

data Signer' a b c d e f g h k l m n = Signer { 
    _signerId              :: a,
    _signerPetitionId      :: b,
    _signerFirstName       :: c,
    _signerLastName        :: d,
    _signerCountry         :: e,
    _signerCity            :: f, 
    _signerOrganization    :: g,
    _signerEmail           :: h,
    _signerPhone           :: k,
    _signerBirthYear       :: l,
    _signerGender          :: m,
    _signerNotifiesEnabled :: n
} deriving Generic
type Signer = Signer' Int Int Text Text Text Text Text Text Text Int Text Bool

deriving instance Show Signer
deriving instance Eq Signer
instance ToJSON   Signer
instance FromJSON Signer

-- ** SignerForm

data SignerForm = SignerForm { 
    _signerFormFirstName       :: Text,
    _signerFormLastName        :: Text,
    _signerFormCountry         :: Text,
    _signerFormCity            :: Text,
    _signerFormOrganization    :: Text,
    _signerFormEmail           :: Text,
    _signerFormPhone           :: Text,
    _signerFormBirthYear       :: Int,
    _signerFormGender          :: Text,
    _signerFormNotifiesEnabled :: Bool
} deriving Generic

instance ToJSON   SignerForm
instance FromJSON SignerForm

-- ** SignerAgg

data SignerAgg' a b c d = SignerAgg { 
    _signerAggId          :: a,
    _signerAggPetitionId  :: b,
    _signerAggCnt         :: c,
    _signerAggDescription :: d 
} deriving Generic
type SignerAgg = SignerAgg' Int Int Int Text
