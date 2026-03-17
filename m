Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0700C3C196B
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751418; cv=none; b=V05tORESkznYX1aU1aP5UKEAIrrWk98cHjH9E+jrfPazf30/pjK+k38slZz1QyAoEIo2vdx+mCyUrl93++Efnqko/2ekc7i/0IUT9OU8k+TxK9vvHcpaFRxCcTyoQkoQ2kwBxdbJjeNw1U0fgcKJxk+7CYNf7oNXeaavoAzaaEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751418; c=relaxed/simple;
	bh=4f7WX9UXZ066LqHEzSW6JvuBor2GR6Fo+KiOrCT/yq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpBVqRbGNEhvgDlaxlI5wUpb08EruGuYWgtqAxHCLV5O79CoRGr3CS/cR8/j6XVh/Kgl+6f707HR0I4QdB41F7Bx0obbSABXq97DgrkqgY+sbY/dUt+MYPncL2vhijs7B+RcXX2pKZGguidGfa8OKvFI+MPUThIEkyGck0MVeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=afD3lOLn; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="afD3lOLn"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fZrwR4KQrz8cMs;
	Tue, 17 Mar 2026 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750807;
	bh=4f7WX9UXZ066LqHEzSW6JvuBor2GR6Fo+KiOrCT/yq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=afD3lOLnkBdBhZ+2VqZD/wRDs0i0UGCLRQtDKgV9V25ggtWIkz4CGkFow3vDkuJxg
	 M4LaXm7qQZ8Pon2mW8zxMMwQO77FZ3u5Z13KVbjHCPGd5NXVlbERbtHq56dD/7sPeB
	 yvciSG214Ja0XEvjInXoqsyC6FppFcNT9bScuelwRyBohQ3OAzcqb0sjdBs3Arj9Wf
	 BPzg9qkZ/k8UCr3z3xG6JhTIjrMyW1EtitVGefX4UGgO+3l2tHetDRsKjl0njlu3or
	 Sby3qiOEYX68cdSEUzpnC73bOUDizOfI0Zai4n3AtzNDK1l2TT+hjxdlfXOXRf5/tv
	 jdzNWQwV7j/uA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fZrwR3ZwTz8cMg;
	Tue, 17 Mar 2026 12:33:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fZrwQ3Bmrz8sbW;
	Tue, 17 Mar 2026 13:33:26 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 93ECF635CB;
	Tue, 17 Mar 2026 13:33:25 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] docs: reporting-issues: mention text is best viewed
 rendered
Date: Tue, 17 Mar 2026 13:33:04 +0100
Message-ID: 
 <f8e3577df4a231b66e8f638f7b41614bf15b49ab.1773750701.git.linux@leemhuis.info>
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
X-PPP-Message-ID: <177375080582.2889257.5836671591820656891@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 93ECF635CB
X-NC-CID: ffUWQ4pCXsLGdz8NQBucWiPeINIVtVR0VW8EctvlT108AhWVI84=

Add a comment before the step-by-step guide explaining that the document
is best viewed in the rendered form, as there the internal links will
work that later patches will add.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
v2
- Drop the switch from double to single quotes

v1 – https://lore.kernel.org/all/4f7e2de2a2336c52e55cc49dcda627a4e86b8793.1761481839.git.linux@leemhuis.info/
- Initial version
---
 Documentation/admin-guide/reporting-issues.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index a68e6d90927471..049dd9b663513d 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -48,6 +48,16 @@ Once the report is out, answer any questions that come up and help where you
 can. That includes keeping the ball rolling by occasionally retesting with newer
 releases and sending a status update afterwards.
 
+..
+   Note: If you see this note, you are reading the text's source file. You
+   might want to switch to a rendered version: It makes it a lot easier to
+   read and navigate this document -- especially when you want to look something
+   up in the reference section, then jump back to where you left off.
+..
+   Find the latest rendered version of this text here:
+   https://docs.kernel.org/admin-guide/reporting-issues.html
+
+
 Step-by-step guide how to report issues to the kernel maintainers
 =================================================================
 
-- 
2.53.0

