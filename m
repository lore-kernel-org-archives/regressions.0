Received: from p3plwbeout24-05.prod.phx3.secureserver.net (p3plsmtp24-05-2.prod.phx3.secureserver.net [68.178.252.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD46110
	for <regressions@lists.linux.dev>; Thu, 20 Oct 2022 22:39:35 +0000 (UTC)
Received: from mailex.mailcore.me ([94.136.40.142])
	by :WBEOUT: with ESMTP
	id le9aoLGq6jhl4le9bovO03; Thu, 20 Oct 2022 15:36:43 -0700
X-CMAE-Analysis: v=2.4 cv=WMe64lgR c=1 sm=1 tr=0 ts=6351cd7b
 a=s1hRAmXuQnGNrIj+3lWWVA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=Qawa6l4ZSaYA:10 a=VwQbUJbxAAAA:8 a=FXvPX3liAAAA:8
 a=NzQU21p7aw8KqXuY42AA:9 a=AjGcO6oz07-iQ99wixmX:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: le9aoLGq6jhl4
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=phoenix.fritz.box)
	by smtp12.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1ole9Z-0006zQ-Oa; Thu, 20 Oct 2022 23:36:42 +0100
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
Subject: [PATCH 3/3] squashfs: fix buffer release race condition in readahead code
Date: Thu, 20 Oct 2022 23:36:16 +0100
Message-Id: <20221020223616.7571-4-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfAN9DSjG7nbX/cB8wTZrGoQqxKilJugOU2jMh90rj/5JYvfd/UM4KzUZCi+LP9zgAO4t1eU+cUcldDUnBpZAkkqLeBkiGrSiTZI/jOjLwQT5O47D90QR
 R6CWAgkWnVLsvWkB9okU44+mTQkPFMYHQdsVTyXOV6Lc83gNqIyB/2Ma3D/U3Z/P60EQJClYmMEOc3QsrCT6loE1Mu2gLatRXqE=

Fix a buffer release race condition, where the error value was
used after release.

Fixes: b09a7a036d20 ("squashfs: support reading fragments in readahead call")
Cc: <stable@vger.kernel.org>
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/file.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index f0afd4d6fd30..8ba8c4c50770 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -506,8 +506,9 @@ static int squashfs_readahead_fragment(struct page **page,
 		squashfs_i(inode)->fragment_size);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
 	unsigned int n, mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
+	int error = buffer->error;
 
-	if (buffer->error)
+	if (error)
 		goto out;
 
 	expected += squashfs_i(inode)->fragment_offset;
@@ -529,7 +530,7 @@ static int squashfs_readahead_fragment(struct page **page,
 
 out:
 	squashfs_cache_put(buffer);
-	return buffer->error;
+	return error;
 }
 
 static void squashfs_readahead(struct readahead_control *ractl)
-- 
2.35.1

