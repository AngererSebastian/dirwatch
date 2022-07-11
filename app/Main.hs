{-# LANGUAGE NumericUnderscores #-}
module Main where

import System.IO (stdout, hFlush)
import System.Directory (listDirectory)
import System.Environment (getArgs)
import Control.Concurrent (threadDelay)
import Control.Monad (mapM_, (>>))
import Data.List ((\\))

go :: FilePath -> [FilePath] -> IO ()
go dir fs = do
    new <- listDirectory dir

    mapM_ putStrLn $ new \\ fs
    hFlush stdout

    threadDelay 5_000_000 -- wait 5 seconds
    go dir new

main :: IO ()
main = do
    (dir: _) <- getArgs
    paths <- listDirectory dir
    go dir paths
