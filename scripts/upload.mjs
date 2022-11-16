import * as dotenv from 'dotenv';
dotenv.config()
import { filesFromPath } from 'files-from-path'
import { Blob } from 'buffer';
import path from 'path'
import fs from 'fs';
import { NFTStorage } from 'nft.storage';

async function storeNFT() {
    const nftstorage = new NFTStorage({ token: process.env.NFT_STORAGE_KEY })
    const directoryPath = 'sertifikat-metadata'
    const files = filesFromPath(directoryPath, {
        pathPrefix: path.resolve(directoryPath), // see the note about pathPrefix below
        hidden: true, // use the default of false if you want to ignore files that start with '.'
      })
    return await nftstorage.storeDirectory(files)
}

async function main() {
    const result = await storeNFT()
    console.log(result)
}

main()
  .catch(err => {
      console.error(err)
      process.exit(1)
  })