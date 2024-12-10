Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D061DC9AB;
	Tue, 10 Dec 2024 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825729; cv=none; b=kUZ2sLEHB6dOe8BuwlIN+mnGriVQNc1WBETNTdn4ObfAAAEu8tyVAPoIp2k4PnOQ/CAb9qXsKCpNswiuuIwssAmn+1P7IPJynjuqgwVNpD6qbLgLGUnxMcLiEXh5UVEXWO5CVhCriulIi0SRFQPSfmIX6LmiZ+xKwIykQHJL5bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825729; c=relaxed/simple;
	bh=ZltGseGxuALKA9lgjvDB+bTy0Jf+ZCxdTO0exFuu8g8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IH1/JXKKCT8+lWG5F3dIDHIEoip1vq1Z+tJRtVCWGAPzze6UcjTdqd3SSUNBuUwTS/lG2UqjaA6qemZh9CNtPytn5YmnzDzq9RqsH7x/RNO+nbHLrgcpu9mn5DzxPXD/b/dKeEGEkMAKaccys9hq006iPSTiXGjS8OMEIMz6ZPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=rGGr7k8G; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="rGGr7k8G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=h23UIyxbntaprmGdDox3nJG9jMNwsQhMEAgLKpnaLtU=; t=1733825727; x=1734257727; 
	b=rGGr7k8GaXZHVfqKD9HBH1WSfatMDTZGPVcOGmvL3O1xmaC9FgqLO0v6X8qKdPrdZvFqwcRvT7j
	PUdUlE6tEURvDR4nke7a3wfn34rJDjwlnDK3Ag3VW2P1+0Pa5QIhFdRYW1Mbl2r4Z3EU2LIHgsFZP
	pnROJrAvNOx00MOQzS06/8wufsKHghkx+Adl0oyMn3K+3UkDfXHDue0wDUNF/+6+Q8L2qBRlgnIc+
	3eeYH0BLH2NlWbKUASkpeP30uxlXpolIDH5vQoahJaVWlcTkCXCMQenjrjFMYxRK4KnEmIBLl3Zpl
	IY4Vop65YiU/zWioix7BeSm5Erj907sBmIqw==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1tKxGu-002jXf-0D;
	Tue, 10 Dec 2024 11:15:16 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH v1 0/6] docs: add instruction about handling regressions to our core texts for contributors
Date: Tue, 10 Dec 2024 11:15:09 +0100
Message-ID: <cover.1733825632.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1733825727;175a7289;
X-HE-SMSGID: 1tKxGu-002jXf-0D

Add some more detailed instruction on handling regressions to our core
texts for contributors, e.g. Documentation/process/6.Followthrough.rst
and Documentation/process/submitting-patches.rst. This was asked for at
the last Maintainer Summit[1] and is meant to help clarifing what's
expected.

The added instructions are somewhat inspired by existing and sometimes
similar text in Documentation/process/handling-regressions.rst which is
semoved during the series.

The patch-set starts with some basics, which are based on the existing
text or recent statements from Linus. I tried to stay close to what was
said, but used my own words here -- if I got something wrong just tell
me so I can fix this.

The guidelines then are extended in multiple steps to cover more things
and be more specific in some areas. Some of that is meant to work
against problems I noticed during my regression tracking work. Most of
these are my words. These thus need to be discussed properly and in the
end ideally ACKed by Linus, so we all know what he wants. The parts I
expect to get more discussion are found near the end of the patchset.

Link: https://lwn.net/Articles/990599/ [1]
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

v1:
- initial version

Thorsten Leemhuis (6):
  docs: more detailed instructions on handling regressions
  docs: 6.Followthrough.rst: when to involved Linus in regressions
  docs: 6.Followthrough.rst: interaction with stable wrt to regressions
  docs: 6.Followthrough.rst: tags to use in regressions fixes
  docs: 6.Followthrough.rst: more specific advice on fixing regressions
  docs: 6.Followthrough.rst: advice on handling regressions fixes

 Documentation/process/6.Followthrough.rst     | 152 ++++++++++++++++--
 .../process/handling-regressions.rst          | 111 +------------
 Documentation/process/submitting-patches.rst  |  20 +++
 3 files changed, 157 insertions(+), 126 deletions(-)


base-commit: 010a08cbf0d63b246c4cd0d385c3f664add2322d
-- 
2.45.0

