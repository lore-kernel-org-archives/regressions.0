Received: from p3plwbeout21-01.prod.phx3.secureserver.net (p3plsmtp21-01-2.prod.phx3.secureserver.net [68.178.252.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8137C6110
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 22:39:32 +0000 (UTC)
Received: from mailex.mailcore.me ([94.136.40.143])
	by :WBEOUT: with ESMTP
	id le9XonySBPZ7Ple9YoV0Ig; Thu, 20 Oct 2022 15:36:40 -0700
X-CMAE-Analysis: v=2.4 cv=If5C5Uma c=1 sm=1 tr=0 ts=6351cd78
 a=EhJYbXVJKsomWlz4CTV+qA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=Qawa6l4ZSaYA:10 a=FXvPX3liAAAA:8 a=VwQbUJbxAAAA:8
 a=z1XB94rXoAV2oHx9HPIA:9 a=UObqyxdv-6Yh2QiB9mM_:22 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: le9XonySBPZ7P
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=phoenix.fritz.box)
	by smtp12.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1ole9W-0006zQ-Jd; Thu, 20 Oct 2022 23:36:38 +0100
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: hsinyi@chromium.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	dimitri.ledkov@canonical.com,
	michael.vogt@canonical.com,
	phillip.lougher@gmail.com,
	ogra@ubuntu.com,
	olivier.tilloy@canonical.com,
	Phillip Lougher <phillip@squashfs.org.uk>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] squashfs: fix extending readahead beyond end of file
Date: Thu, 20 Oct 2022 23:36:15 +0100
Message-Id: <20221020223616.7571-3-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221020223616.7571-1-phillip@squashfs.org.uk>
References: <20221020223616.7571-1-phillip@squashfs.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated:  phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfNkikWuCxcLJ/tqA8K93gUZbLe3NXIygoIj1REY0+/UU7oTFjVyTcLKU+BkxJ4i/H6Hi6sfk9unqdom21nmd1TJnkNflUIuS2mfVqR6GiqO3ZLpeS4jx
 APaAz/svXc7cbSQP0xH4YC8A77/K6xnkWLR3r6ZhecJMYGeDwsIHnePikIw03yozCZUz4Ruj4DlYojRRuKaGzO9KJfGPoyxMdtc=

The readahead code will try to extend readahead to the entire
size of the Squashfs data block.

But, it didn't take into account that the last block at the end of
the file may not be a whole block.  In this case, the code would
extend readahead to beyond the end of the file, leaving trailing
pages.

Fix this by only requesting the expected number of pages.

Fixes: 8fc78b6fe24c ("squashfs: implement readahead")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
Cc: <stable@vger.kernel.org>
---
 fs/squashfs/file.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index e526eb7a1658..f0afd4d6fd30 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -559,6 +559,12 @@ static void squashfs_readahead(struct readahead_control *ractl)
 		unsigned int expected;
 		struct page *last_page;
 
+		expected = start >> msblk->block_log == file_end ?
+			   (i_size_read(inode) & (msblk->block_size - 1)) :
+			    msblk->block_size;
+
+		max_pages = (expected + PAGE_SIZE - 1) >> PAGE_SHIFT;
+
 		nr_pages = __readahead_batch(ractl, pages, max_pages);
 		if (!nr_pages)
 			break;
@@ -567,13 +573,10 @@ static void squashfs_readahead(struct readahead_control *ractl)
 			goto skip_pages;
 
 		index = pages[0]->index >> shift;
+
 		if ((pages[nr_pages - 1]->index >> shift) != index)
 			goto skip_pages;
 
-		expected = index == file_end ?
-			   (i_size_read(inode) & (msblk->block_size - 1)) :
-			    msblk->block_size;
-
 		if (index == file_end && squashfs_i(inode)->fragment_block !=
 						SQUASHFS_INVALID_BLK) {
 			res = squashfs_readahead_fragment(pages, nr_pages,
-- 
2.35.1

