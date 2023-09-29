Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F61864
	for <regressions@lists.linux.dev>; Fri, 29 Sep 2023 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=b5VDm8pCRnjpmNRGqpxZQw2QpEXt0FwnHldzbBa/Ilc=; b=BzNwpdsQSIXlEuhSUz9JuJNKhl
	7GreMa4bliXwyQ+LL2Fjw5wdNIcHRRGu0bKi/k0tpqkGUsa2MGID96UQdxeHu+WTerb+jq2e6qVAi
	JwlTfRonlSNMnQA6M7zLzC5Q/+oNNoMAgfPXJre3lEEGjW6UF8kY1T+iHAFcqovYZJz+lNN9hTzSY
	3DtFpHgRQAS74ZFy3l8d1Nxc6b7LqlA07K67ASe+q7H67DtG7PJBz8nPUx91GZDT19PKtK0xcNz13
	ZQ8LB6DYHS2xfOy4NY2fahR9/5mdmzXhePIZtz7+fES22uthcvgpnbzZPicGyUJm54DVVdGjUa58A
	YRUNH2OQ==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1qmC1Q-00AvbZ-On
	for regressions@lists.linux.dev; Fri, 29 Sep 2023 11:51:04 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
Content-Type: text/plain; charset=utf-8
X-Loop: owner@bugs.debian.org
From: "Debian Bug Tracking System" <owner@bugs.debian.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Bug#1051592: Info received (Regression: Commit "netfilter:
 nf_tables: disallow rule addition to bound chain via NFTA_RULE_CHAIN_ID"
 breaks ruleset loading in linux-stable)
Message-ID: <handler.1051592.B1051592.16959880042602492.ackinfo@bugs.debian.org>
References: <89dded30-d250-4b7a-b5a8-b18e3b509bf1@leemhuis.info>
X-Debian-PR-Message: ack-info 1051592
X-Debian-PR-Package: src:nftables
X-Debian-PR-Keywords: upstream confirmed
X-Debian-PR-Source: nftables
Reply-To: 1051592@bugs.debian.org
Date: Fri, 29 Sep 2023 11:51:04 +0000

Thank you for the additional information you have supplied regarding
this Bug report.

This is an automatically generated reply to let you know your message
has been received.

Your message is being forwarded to the package maintainers and other
interested parties for their attention; they will reply in due course.

Your message has been sent to the package maintainer(s):
 Debian Netfilter Packaging Team <pkg-netfilter-team@lists.alioth.debian.or=
g>

If you wish to submit further information on this problem, please
send it to 1051592@bugs.debian.org.

Please do not send mail to owner@bugs.debian.org unless you wish
to report a problem with the Bug-tracking system.

--=20
1051592: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1051592
Debian Bug Tracking System
Contact owner@bugs.debian.org with problems
