Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855062F
	for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 10:54:24 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pTKrG-0007ro-Mg; Sat, 18 Feb 2023 11:54:22 +0100
Message-ID: <02498ae8-798d-2fa8-51ab-4f9360672c7e@leemhuis.info>
Date: Sat, 18 Feb 2023 11:54:21 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Linux regressions report for mainline [ extra issue due to pending
 6.2 release]
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676717665;248ce1f8;
X-HE-SMSGID: 1pTKrG-0007ro-Mg

Hi Linux! A quick special report, mainly due to one issue:

* There is a regression in the qcom-venus driver that leads to problems
on various systems. A revert was proposed, but the driver's maintainer
wanted to fix it instead. That didn't happen yet afaics. On Wednesday I
asked Mauro to look into the situation and maybe pick up the revert, but
he didn't reply.

Report:
https://lore.kernel.org/lkml/Y9LSMap%2BjRxbtpC8@google.com/

Proposed revert:
https://lore.kernel.org/lkml/20230207102254.1446461-1-javierm@redhat.com/


While at it let me quickly mention a few other issues I'm aware of:

* Finally a fix for a much discussed IOMMU issue on certain AMD
platforms showed up; the author asked for it to be merged for 6.2, but
that might have come to late for Jörg to notice. See here:
https://lore.kernel.org/linux-iommu/0f6e2838-9d7f-dc2c-6e5b-0d02e239f032@amd.com/

But according to tests from the reporter that leads to a new warning
from amdgpu:
https://lore.kernel.org/linux-iommu/e17d1ee9-7383-6717-6f10-9465b273b1ed@amd.com/T/#m98390232691e3e55db7f1187073016436fd2176a

* Pretty sure Jens will decide himself if he still wants to send this
nvme last-minute fix for a nvme regression that surfaced this week:
https://lore.kernel.org/lkml/151a00d9-0ea2-eadb-72b4-fa8a2dd41bfc@kernel.dk/
https://bugzilla.kernel.org/show_bug.cgi?id=217037

* Pretty sure you'll get this fix with the weekly pull from the TIP folks:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=f9f57da2c2d119dbf109e3f6e1ceab7659294046

* Nothing new from Chuck's regression that broke the git regression
suite on all NFS versions (when tmpfs is involved), so I guess that will
never be fixed:
https://lore.kernel.org/linux-nfs/9A4A5673-691D-47EC-BC44-C43BE7E50A48@oracle.com/

Ciao, Thorsten
