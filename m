Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C44699
	for <regressions@lists.linux.dev>; Mon, 17 Oct 2022 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2811DC433D6;
	Mon, 17 Oct 2022 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666025911;
	bh=rJ6LU88HdWZfQekpX5aYB1LKhnFZYpilNhnm/OrRnk0=;
	h=From:To:Cc:Subject:Date:From;
	b=l3MPwoMexobQ5ze+Gry1PqvIOtMc1M0U/+RLrxuY5Wdtni56IDgVYPTrBx7nm0Onh
	 up5RhLQ83oxNOhO/xgvzbumyF7jOBr2MhJQIra1fKG2lrvicpu7Mnd+vSyQPNlHPKW
	 rPxwdm1wEI3xPe2gYH4S6UlIm+oIBg2bX7q+T7XwivQQ1lGMZnKouc6ebZFCziujVe
	 Y1/WccQnf4LNOPuY1FKBcv1X/fQCZl2n0mzCkBte9Py68GRHONiwHgPb7HIBUmzyNu
	 nBKaVQVE6XtOmN+lqeT4lgUdPVaxt5puxdmzVnGDXV9HhsNZnHMl016Qohsq3m8Awe
	 3s2xnw8NNdhLA==
From: Kalle Valo <kvalo@kernel.org>
To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mel Gorman <mgorman@techsingularity.net>, Bjorn Helgaas <bhelgaas@google.com>,
    linux-rtc@vger.kernel.org, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [REGRESSION v6.1-rc1] rtc: cmos: rtcwake broken on NUC8i7HVK
Date: Mon, 17 Oct 2022 19:58:23 +0300
Message-ID: <87edv6mlow.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Rafael and Alexandre,

I upgraded my NUC8i7HVK test box to v6.1-rc1 and noticed that my suspend
tests with ath11k were broken, the box never woke up from suspend
automatically and I had to manually push the power button to trigger
resume. This is the command I used:

sudo rtcwake -m mem -s 30

v6.0 works without problems and a bisect found this commit:

commit 4919d3eb2ec0ee364f7e3cf2d99646c1b224fae8
Author:     Rafael J. Wysocki <rafael.j.wysocki@intel.com>
AuthorDate: Wed Oct 12 20:07:01 2022 +0200
Commit:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CommitDate: Thu Oct 13 23:27:52 2022 +0200

    rtc: cmos: Fix event handler registration ordering issue

And indeed reverting that commit fixed the issue and suspend works as
before. Here's some info about my hardware:

$ dmesg | grep rtc
[   10.884460] rtc_cmos 00:03: RTC can wake from S4
[   10.888439] rtc_cmos 00:03: registered as rtc0
[   10.888930] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram

$ lshw
nuc2
    description: Desktop Computer
    product: NUC8i7HVK
    vendor: Intel(R) Client Systems
    version: J71485-504
[...]
     *-cpu
          description: CPU
          product: Intel(R) Core(TM) i7-8809G CPU @ 3.10GHz
[...]
     *-pnp00:03
          product: PnP device PNP0b00
          physical id: 4
          capabilities: pnp
          configuration: driver=rtc_cmos

Do let me know if more info is needed, I can also test patches. But next
week I'm travelling and do not have access to the box.

Kalle
