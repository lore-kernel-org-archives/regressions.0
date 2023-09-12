Received: from buxtehude.debian.org (buxtehude.debian.org [209.87.16.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D88F6D
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bugs.debian.org; s=smtpauto.buxtehude; h=Date:Reply-To:References:
	Message-ID:Subject:To:From:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Cc:Content-ID:Content-Description:In-Reply-To;
	bh=YzQpK4hwFNuKP1sqW5srPpdMLHDpzKra7IQvkBajou8=; b=oi4hryoJcuL/YX3lhQEZnfowDu
	N5H4VgHzPDLdj0EhJk7+z6u3BQMBZJq+MfFmmkRMSRpYDs5bhA/KkipIfd6b5261lHYxToLPwoEeB
	A7Y4GixlPbf8443vBSvNfCKexXX5xhPmihrleuYT79kIO4VoxAizCrX1KPM39WvEjS1FqdPDJ7okG
	Iyr0br4QMYc4njCxiF1t2v4SKSWwjS7lgE+MgBQNmfXKNQFy4BtjgJ1rIYh0YKCzQtd6kH1GG5aMp
	nQductEUTTPC9bWGY3ovgHbszSrUXhjeonEQ3GzErfi2oz3G03d7NVpYgG+wn17egHkDFHIsxoMYR
	zIsqXRRw==;
Received: from debbugs by buxtehude.debian.org with local (Exim 4.94.2)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1qfzU7-00G3ZE-RO
	for regressions@lists.linux.dev; Tue, 12 Sep 2023 09:15:03 +0000
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
Message-ID: <handler.1051592.B1051592.16945099983825384.ackinfo@bugs.debian.org>
References: <b30a81fa-6b59-4bac-b109-99a4dca689de@leemhuis.info>
X-Debian-PR-Message: ack-info 1051592
X-Debian-PR-Package: linux
X-Debian-PR-Keywords: upstream confirmed
X-Debian-PR-Source: linux
Reply-To: 1051592@bugs.debian.org
Date: Tue, 12 Sep 2023 09:15:03 +0000

Thank you for the additional information you have supplied regarding
this Bug report.

This is an automatically generated reply to let you know your message
has been received.

Your message is being forwarded to the package maintainers and other
interested parties for their attention; they will reply in due course.

Your message has been sent to the package maintainer(s):
 Debian Kernel Team <debian-kernel@lists.debian.org>

If you wish to submit further information on this problem, please
send it to 1051592@bugs.debian.org.

Please do not send mail to owner@bugs.debian.org unless you wish
to report a problem with the Bug-tracking system.

--=20
1051592: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1051592
Debian Bug Tracking System
Contact owner@bugs.debian.org with problems
