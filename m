Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698EEC4
	for <regressions@lists.linux.dev>; Wed, 24 Aug 2022 10:32:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oQnfy-0005He-2w; Wed, 24 Aug 2022 12:31:58 +0200
Message-ID: <363d7f20-b843-22b5-5437-cf7fef11aa51@leemhuis.info>
Date: Wed, 24 Aug 2022 12:31:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Bug 216087 - Only Toshiba MG08/MG09 SATA hard disks disappear after
 resume from S3 suspend (reproducible) - AMD Ryzen 5 PRO 4650G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661337120;e9fce9bb;
X-HE-SMSGID: 1oQnfy-0005He-2w

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled there already, nevertheless I'd like to add to the tracking to
ensure it's doesn't fall through the cracks in the end:

#regzbot introduced: v5.16..v5.17
https://bugzilla.kernel.org/show_bug.cgi?id=216087
#regzbot ignore-activity
#regzbot backburner: hard to debug, as reporter is unable to try custom
kernels

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
