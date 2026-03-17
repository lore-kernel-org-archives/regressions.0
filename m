Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B53C196B
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751392; cv=none; b=rxtnIP5jFLxMUFi2iM734gx7PTOdZd1BKUG5Zg19k+FFkrz8B0SiEkZRP+guYLwD06bgM0smYbMz8lyZ2m8ViWtWqmxD/4clGAJUAIDxSBnF0BD6nvM/m8Vx33gwOZjnSNQBBPdqnvZrCpwzGGbO1itjbrGk2zP7kdMtelPR7XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751392; c=relaxed/simple;
	bh=HvFK70HRpg5LxjabB1w8VIetM315CyKC751q1GpP+OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssq7yFcpHH1QqfVYNfrJDXFHK+aBvsmWPNaz/5W53cUu2ZocB2SiaBStppj6sPP67ddmkYJvmZscBJnjco2r2Xv82tdwbpsFhqM6QxMxarnrQ5wd9wTu/DbogN1q2QND7VINEsjwqQFGuVDazNEXVFLMnYNp34KpiK0p7tS47JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Y9iNDBJq; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Y9iNDBJq"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fZrwS3bzQz67bZ;
	Tue, 17 Mar 2026 13:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750808;
	bh=HvFK70HRpg5LxjabB1w8VIetM315CyKC751q1GpP+OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y9iNDBJqksIo/wi1x+u3l7YHAeHB8FNJS2F2wjpRKo3yC8VL6ya2A830iydArYFf+
	 +qp9onbhsQUqVLEXWjpGBgho+1LplDeYWzMc0Ay76E2eVJJC0dSWrPgMQJeY9Oq9fB
	 H6+yxxi24b+rt8GtbXpmacGq51OpGS89DWaQlewh+kvZr1F3qAtlrNiD/4DOokiDE4
	 lf5m//kepp0x+gGDXXKlIOvUTgmlKzfdz4jq2/4jjnsm3jkk4jMishIUR2Sp3VG4z8
	 kY7fRRDuJlaHwf2OdAXrVAxGFn6uPsgTHOURHpmd2MW+zNm3Ora/EcttxyJLpEUr2I
	 CvyNE0nxQLqtA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fZrwS2v7Yz4xLW;
	Tue, 17 Mar 2026 13:33:28 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fZrwS0lP3z8svF;
	Tue, 17 Mar 2026 13:33:28 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A7CCC635CB;
	Tue, 17 Mar 2026 13:33:27 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] =?UTF-8?q?docs:=20verify-bugs-=E2=80=A6=20and=20qu?=
 =?UTF-8?q?ickly-build-=E2=80=A6:=20improve=20feedback=20section?=
Date: Tue, 17 Mar 2026 13:33:07 +0100
Message-ID: 
 <cb219ccd15271bfb99ecce01dcbdbb03cccd7be1.1773750701.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773750701.git.linux@leemhuis.info>
References: <cover.1773750701.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177375080792.2889273.1822819562808559532@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A7CCC635CB
X-NC-CID: ZTD0kk1SI7NByACqlbGtBMhZVZleCXzkBH5zxd+hG9lXITp04bc=

Mention sending patches in the section about feedback. This syncs them
with a section a earlier patch added to reporting-issues.rst, which
was based on these sections and improved during review.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 .../admin-guide/quickly-build-trimmed-linux.rst   | 14 ++++++++------
 .../verify-bugs-and-bisect-regressions.rst        | 15 +++++++--------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index cb4b78468a935d..cb178e0a620848 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -349,12 +349,14 @@ again.
 
 .. _submit_improvements_qbtl:
 
-Did you run into trouble following any of the above steps that is not cleared up
-by the reference section below? Or do you have ideas how to improve the text?
-Then please take a moment of your time and let the maintainer of this document
-know by email (Thorsten Leemhuis <linux@leemhuis.info>), ideally while CCing the
-Linux docs mailing list (linux-doc@vger.kernel.org). Such feedback is vital to
-improve this document further, which is in everybody's interest, as it will
+Did you run into trouble following the step-by-step guide not cleared up by the
+reference section below? Did you spot errors? Or do you have ideas on how to
+improve the guide?
+
+If any of that applies, please let the developers know by sending a short note
+or a patch to Thorsten Leemhuis <linux@leemhuis.info> while ideally CCing the
+public Linux docs mailing list <linux-doc@vger.kernel.org>. Such feedback is
+vital to improve this text further, which is in everybody's interest, as it will
 enable more people to master the task described here.
 
 Reference section for the step-by-step guide
diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index d83601f2a459ff..7d38393f31fb16 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -1062,16 +1062,15 @@ Conclusion
 
 You have reached the end of the step-by-step guide.
 
-Did you run into trouble following any of the above steps not cleared up by the
-reference section below? Did you spot errors? Or do you have ideas how to
+Did you run into trouble following the step-by-step guide not cleared up by the
+reference section below? Did you spot errors? Or do you have ideas on how to
 improve the guide?
 
-If any of that applies, please take a moment and let the maintainer of this
-document know by email (Thorsten Leemhuis <linux@leemhuis.info>), ideally while
-CCing the Linux docs mailing list (linux-doc@vger.kernel.org). Such feedback is
-vital to improve this text further, which is in everybody's interest, as it
-will enable more people to master the task described here -- and hopefully also
-improve similar guides inspired by this one.
+If any of that applies, please let the developers know by sending a short note
+or a patch to Thorsten Leemhuis <linux@leemhuis.info> while ideally CCing the
+public Linux docs mailing list <linux-doc@vger.kernel.org>. Such feedback is
+vital to improve this text further, which is in everybody's interest, as it will
+enable more people to master the task described here.
 
 
 Reference section for the step-by-step guide
-- 
2.53.0

