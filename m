Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13A10EE
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 09:56:06 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pDjSG-00082O-Cl; Fri, 06 Jan 2023 10:56:04 +0100
Message-ID: <366a47b4-b530-68c2-992d-c2861a8add5c@leemhuis.info>
Date: Fri, 6 Jan 2023 10:56:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#adding)" <regressions@leemhuis.info>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: =?UTF-8?Q?Bug=c2=a0216889_-_CIFS_1=2e0_mount_succeeds_but_any_attem?=
 =?UTF-8?Q?pt_to_read_from_/_write_to_the_share_fails?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672998966;c616a2e1;
X-HE-SMSGID: 1pDjSG-00082O-Cl

[TLDR: Just adding a regression reported to bko to the tracking]

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled there already, nevertheless I'd like to add to the tracking to
ensure it's doesn't fall through the cracks in the end:

#regzbot introduced: v6.0..v6.1
https://bugzilla.kernel.org/show_bug.cgi?id=216889
#regzbot title: cifs: CIFS 1.0 mount succeeds but any attempt to read
from / write to the share fails
#regzbot ignore-activity

Regression is also in stable, to quote:

> 6.0.15 works fine - 6.0.16 doesn't.

/me sooner or later needs to modify regzbot to handle such situations better

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
