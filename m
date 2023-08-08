Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4334A34
	for <regressions@lists.linux.dev>; Tue,  8 Aug 2023 06:10:56 +0000 (UTC)
Received: from [185.238.219.21] (helo=[192.168.44.45]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qTFvd-00072q-6h; Tue, 08 Aug 2023 08:10:49 +0200
Message-ID: <661fcece-a83c-cb24-1b37-5d8693b1fb94@leemhuis.info>
Date: Tue, 8 Aug 2023 08:10:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Regression fix not progressing towards mainline/stable
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org, LKML
 <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Alsa-devel <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691475058;003ceb48;
X-HE-SMSGID: 1qTFvd-00072q-6h

Hi everyone, I noticed a regression fix that afaics lingers in the
thesofproject's git repo instead of progressing towards the stable trees
and wondered what's up here.

I'm talking about about the fix "ASoC: SOF: intel: hda: Clean up link
DMA for IPC3 during stop" for this ticket:
https://github.com/thesofproject/linux/issues/4455

Two more tickets about it:
https://github.com/thesofproject/linux/issues/4482
https://bugzilla.kernel.org/show_bug.cgi?id=217673

It seems the fix is ready and reviewed for two weeks now, but not even
in -next by now. That's not how it should be for regression fixes, as
per https://docs.kernel.org/process/handling-regressions.html it ideally
should be in -stable soon or already. Is this a mistake, am I missing
something, or is there a good reason for this?

Ciao, Thorsten
