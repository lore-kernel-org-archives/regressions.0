Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF731C03
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 09:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241C4C433C8;
	Wed, 30 Aug 2023 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693387298;
	bh=siIZODpxnuFofigGdK4dwZYoGFyU6ZVlCj0AGqstUXY=;
	h=From:To:Cc:Subject:Date:From;
	b=NgYUZygmBVLwFbvipWgScmV9bhRY4kEtxv+LxE1ZR+6xyl9Ra9l+OKjTkwsKUnCLD
	 beOWKm9nyL1Va+AILsLgv0NtwJ2QtqXMLv8ynDEuGiIwgZVZMt16SIOHzWgxPuZsVN
	 xeLpsiLkB27M4lZ/rwqit+jHi9YByXMQjBcgdZxxb19C2y+hzqxYHKYG7Sd6rgWYJB
	 K58+CwM9JjdL3H3y/i5yaHv7FD8sfAfdnK17j8OSiwPXnt7bFmP5S7jI+0rEoCdy1F
	 nppDZS0xW0zmchJck+DBVrBKJVLogG9rnkW+0dtk7EMGUAWgGLjnalXMzHZwviC1QH
	 wy9DkZFZ+4FVw==
From: Kalle Valo <kvalo@kernel.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Bjorn Helgaas
 <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
    ath11k@lists.infradead.org, regressions@lists.linux.dev
Subject: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
Date: Wed, 30 Aug 2023 12:21:34 +0300
Message-ID: <878r9sga1t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I noticed that starting from v6.5-rc1 my ath11k tests reported several
memory leaks from swapper/0:

unreferenced object 0xffff88810a02b7a8 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    80 b8 02 0a 81 88 ff ff b8 72 07 00 00 c9 ff ff  .........r......
    c8 b7 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
unreferenced object 0xffff88810a02b880 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    58 b9 02 0a 81 88 ff ff a8 b7 02 0a 81 88 ff ff  X...............
    a0 b8 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
unreferenced object 0xffff88810a02b958 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    30 ba 02 0a 81 88 ff ff 80 b8 02 0a 81 88 ff ff  0...............
    78 b9 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  x...............
  backtrace:
unreferenced object 0xffff88810a02ba30 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    08 bb 02 0a 81 88 ff ff 58 b9 02 0a 81 88 ff ff  ........X.......
    50 ba 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  P...............
  backtrace:
unreferenced object 0xffff88810a02bb08 (size 96):
  comm "swapper/0", pid 1, jiffies 4294671838 (age 98.120s)
  hex dump (first 32 bytes):
    e0 bb 02 0a 81 88 ff ff 30 ba 02 0a 81 88 ff ff  ........0.......
    28 bb 02 0a 81 88 ff ff 00 00 00 00 00 00 00 00  (...............
  backtrace:

I can easily reproduce this by doing a simple insmod and rmmod of ath11k
and it's dependencies (mac80211, MHI etc). I can reliability reproduce
the leaks but I only see them once after a boot, I need to reboot the
host to see the leaks again. v6.4 has no leaks.

I did a bisect and found the commit below. I verified reverting the
commit makes the leaks go away.

commit e54223275ba1bc6f704a6bab015fcd2ae4f72572
Author:     Ross Lagerwall <ross.lagerwall@citrix.com>
AuthorDate: Thu May 25 16:32:48 2023 +0100
Commit:     Bjorn Helgaas <bhelgaas@google.com>
CommitDate: Fri Jun 9 15:06:16 2023 -0500

    PCI: Release resource invalidated by coalescing

Kalle
