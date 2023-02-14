Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4BE7C
	for <regressions@lists.linux.dev>; Tue, 14 Feb 2023 10:14:04 +0000 (UTC)
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1pRsJr-0007xD-TO; Tue, 14 Feb 2023 11:13:51 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v1] docs: recommend using Link: whenever using Reported-by:
Date: Tue, 14 Feb 2023 11:13:51 +0100
Message-Id: <9a07ec640d809723492f8ade4f54705914e80419.1676369564.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1676369644;fb36ba61;
X-HE-SMSGID: 1pRsJr-0007xD-TO

Encourage developers to place Link: tag pointing to the report when they
are using Reported-by: tags. Those links are often extremely useful for
any code archaeologist that wants to know more about the backstory of a
change than the commit message provides. That includes maintainers
higher up in the patch-flow hierarchy, which is why Linus asks
developers to add such links [1, 2, 3]. To quote [1]:

> Again, the commit has a link to the patch *submission*, which is
> almost entirely useless. There's no link to the actual problem the
> patch fixes.
>
> [...]
>
> Put another way: I can see that
>
> Reported-by: Zhangfei Gao <zhangfei.gao@foxmail.com>
>
> in the commit, but I don't have a clue what the actual report was, and
> there really isn't enough information in the commit itself, except for
> a fairly handwavy "Device drivers might, for instance, still need to
> flush operations.."
>
> I don't want to know what device drivers _might_ do. I would want to
> have an actual pointer to what they do and where.

Another reason why these links are wanted: the ongoing regression
tracking efforts can only scale with them, as they allow the regression
tracking bot 'regzbot' to automatically connect tracked reports with
patches that are posted or committed to fix tracked regressions.

Link: https://lore.kernel.org/all/CAHk-=wjMmSZzMJ3Xnskdg4+GGz=5p5p+GSYyFBTh0f-DgvdBWg@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/ [2]
Link: https://lore.kernel.org/all/CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com/ [3]
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>

---
Hi! Just small change for two texts. Note, the change to
submitting-patches.rst looks bigger than it is, as I reshuffled the
sentences in that area. The new flow afaics makes more sense then it
would have if I had added the 'use Link: tag' recommendation at the end
of the current text.

Ciao, Thorsten
---
 Documentation/process/5.Posting.rst          | 3 ++-
 Documentation/process/submitting-patches.rst | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index d87f1fee4cbc..7a670a075ab6 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -251,7 +251,8 @@ The tags in common use are:
  - Reported-by: names a user who reported a problem which is fixed by this
    patch; this tag is used to give credit to the (often underappreciated)
    people who test our code and let us know when things do not work
-   correctly.
+   correctly. Note, this tag should be followed by a Link: tag pointing to the
+   report, unless the report is not available on the web.
 
  - Cc: the named person received a copy of the patch and had the
    opportunity to comment on it.
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7dc94555417d..1e009dbe6991 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -496,10 +496,11 @@ Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
 ----------------------------------------------------------------------
 
 The Reported-by tag gives credit to people who find bugs and report them and it
-hopefully inspires them to help us again in the future.  Please note that if
-the bug was reported in private, then ask for permission first before using the
-Reported-by tag. The tag is intended for bugs; please do not use it to credit
-feature requests.
+hopefully inspires them to help us again in the future. The tag is intended for
+bugs; please do not use it to credit feature requests. The tag should be
+followed by a Link: tag pointing to the report, unless the report is not
+available on the web. Please note that if the bug was reported in private, then
+ask for permission first before using the Reported-by tag.
 
 A Tested-by: tag indicates that the patch has been successfully tested (in
 some environment) by the person named.  This tag informs maintainers that

base-commit: e076f253283c3e55a128fa9665c0e6cd8146948d
-- 
2.39.1

