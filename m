Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F028F5
	for <regressions@lists.linux.dev>; Sat, 21 May 2022 10:27:45 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nsMKk-0002iX-TX; Sat, 21 May 2022 12:27:42 +0200
Message-ID: <156f1150-e0d6-0ead-bdbf-58eb0049db26@leemhuis.info>
Date: Sat, 21 May 2022 12:27:42 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Bug 215975 - NFSD stops serving clients
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1653128865;f886c41e;
X-HE-SMSGID: 1nsMKk-0002iX-TX

Hi, this is your Linux kernel regression tracker speaking.

About a week ago a regression was reported to bugzilla.kernel.org that
seems to be handled there already. Nevertheless, I'd like to add to the
tracking to ensure it's not forgotten.

#regzbot introduced: v5.12..v5.13
#regzbot from: Ho Ming Shun <cyph1984@gmail.com>
#regzbot title: NFSD stops serving clients
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215975

See the ticket for details, there were a few replies already.

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replied to), as the kernel's
documentation call for; above page explains why this is important for
tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

