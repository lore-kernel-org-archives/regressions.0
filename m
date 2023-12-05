Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B1467E63
	for <regressions@lists.linux.dev>; Tue,  5 Dec 2023 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id EB0F972C8F5;
	Tue,  5 Dec 2023 17:48:31 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id E525A36D0174;
	Tue,  5 Dec 2023 17:48:31 +0300 (MSK)
Date: Tue, 5 Dec 2023 17:48:31 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: regressions@lists.linux.dev, Thorsten Leemhuis <linux@leemhuis.info>
Subject: Broken link to lore post
Message-ID: <20231205144831.hgqya5os4ajn3hxa@altlinux.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline

Hi,

JFYI. On the page

  https://linux-regtracking.leemhuis.info/regzbot/mainline/

In the text:

|  When fixing, add this to the commit message to make regzbot notice patch
|  postings and commits to resolve the issue:
|
|  Fixes: 9dc704dcc09e ("scsi: aacraid: Reply queue mapping to CPUs based on IRQ affinity")
|  Reported-by: bugzilla-daemon@kernel.org <bugzilla-daemon@kernel.org>
|  Link: https://lore.kernel.org/r/bug-217599-11613@https.bugzilla.kernel.org%2F/

The link does not work with 'Not Found' message.

Thanks,

