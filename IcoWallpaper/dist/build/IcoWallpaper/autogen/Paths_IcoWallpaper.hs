{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_IcoWallpaper (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/miksu/Haskell/gloss-projects/IcoWallpaper/.cabal-sandbox/bin"
libdir     = "/home/miksu/Haskell/gloss-projects/IcoWallpaper/.cabal-sandbox/lib/x86_64-linux-ghc-8.6.5/IcoWallpaper-0.1.0.0-1VABVmo37ue3YD5fSeHuqo-IcoWallpaper"
dynlibdir  = "/home/miksu/Haskell/gloss-projects/IcoWallpaper/.cabal-sandbox/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/miksu/Haskell/gloss-projects/IcoWallpaper/.cabal-sandbox/share/x86_64-linux-ghc-8.6.5/IcoWallpaper-0.1.0.0"
libexecdir = "/home/miksu/Haskell/gloss-projects/IcoWallpaper/.cabal-sandbox/libexec/x86_64-linux-ghc-8.6.5/IcoWallpaper-0.1.0.0"
sysconfdir = "/home/miksu/Haskell/gloss-projects/IcoWallpaper/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "IcoWallpaper_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "IcoWallpaper_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "IcoWallpaper_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "IcoWallpaper_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "IcoWallpaper_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "IcoWallpaper_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
