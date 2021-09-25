Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41C3FC7
	for <regressions@lists.linux.dev>; Sat, 25 Sep 2021 17:16:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 760906105A;
	Sat, 25 Sep 2021 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632590182;
	bh=jFXWk8Q8nIxiYyoh2sDpKhRq790Zf8EVX59hvK7LEGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6vYWUHM/bHsaNTM13jz1zIF2bp/bT8EtZvjbfxJRa+ZXQidrLjqb5gocReJH/U6b
	 oA8HFPjsDOZNA6H9DVQ7lpfPKwTPp8pg7vVizdQ9V4Lyu0OsfgfIEXZo2BzAtfewPk
	 Kwg7R6Ql9n3AsTi1qo5XQQpOJZP4RkjkKJby56Dc4RXkoS/H8EutH66/cz5eNBiFFh
	 3ZWrVO2OWeUzw93mbQqHYZ/3tLDlFJdR4o9hkxBkXitY1daMdTDxnl+rz29oD8RK9l
	 qp0M0QPa/e+KQPi7HDSlQa8l73xW0GxqMr4/460azVAO7WSsZPVFFeuZO+o5gkVV/G
	 ofwLGCfRfM/iQ==
Date: Sat, 25 Sep 2021 10:16:18 -0700
From: Keith Busch <kbusch@kernel.org>
To: Orlando Chamberlain <redecorating@protonmail.com>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"gargaditya08@live.com" <gargaditya08@live.com>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"hare@suse.de" <hare@suse.de>, "dwagner@suse.de" <dwagner@suse.de>,
	"hch@lst.de" <hch@lst.de>
Subject: Re: [REGRESSION] nvme: code command_id with a genctr for
 use-after-free validation crashes apple T2 SSD
Message-ID: <20210925171618.GA116968@dhcp-10-100-145-180.wdc.com>
References: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cjJiSFV77WM51ciS8EuBcdeBcv9T83PUB-Kw3yi8PuC_LwrrUUnQ3w5RC1PbKvSYE72KryXp3wOJhv4Ov_WWIe2gKWOOo5uwuUjbbFA8HDM=@protonmail.com>

On Sat, Sep 25, 2021 at 01:10:42PM +0000, Orlando Chamberlain wrote:
> Commit e7006de6c238 causes the SSD controller on Apple T2 computers to crash
> and prevents linux from booting.
> 
> This commit implemented a counter that is stored within the NVMe command_id,
> however this counter makes the command_id higher than normal, causing a panic
> on the T2 security chip that functions as the SSD controller, which then
> causes the system to power off after a few seconds.

Ah, yet another spec non-complainat quirk from these controllers.

> This was reported on bugzilla here:
> https://bugzilla.kernel.org/show_bug.cgi?id=214509 but it was not originally
> classified as NVMe (when the report was created it was unknown what was
> causing it), so I don't know if it notified the NVMe mailing list when it
> was later reclassified to NVMe. Sorry if you've already seen this issue.

The mailing list was not copied, so thank you for directly notifying
this list. 
 
> The T2 security chip (which is the SSD) has this line in its crash log (the
> rest of this log is in an attachment on the bugzilla report):
> 
> panic(cpu 1 caller 0xfffffff028d884ec): ANS2 Recoverable Panic - assert failed: [7447]:command id out of range error (cid = 4120), status_reg: 0x2000 - Null(2)
> 
> This is the entry in lspci -nn for the ssd:
> 
> 04:00.0 Mass storage controller [0180]: Apple Inc. ANS2 NVMe Controller [106b:2005] (rev 01)
> 
> This commit was included in 5.14.6 and backported to 5.10.67, but does not
> occur in 5.14.5 and 5.10.66. I am on a MacBookPro16,1, the crash has been
> reproduced on a MacBookPro16,2 as well. 

Is the PCI VID:DID the same from in your lspci output for all affected
macbooks?

> I have been able to reproduce on Arch
> Linux with vanilla kernel 5.10.67 (others have gotten it on 5.14.6) with no
> DKMS modules, and I bisected it to that commit
> (e7006de6c23803799be000a5dcce4d916a36541a).
> 
> I've tried to modify the genctr so that it is in the other side of the
> command_id (which I thought might make the command_id's lower) with the patch
> below, but it did not prevent the crash.

That might mean the h/w is using the command id as an index into
internal structures. That is not spec compliant, so it sounds like
we'll need to introduce another quirk for the macs.
