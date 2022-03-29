Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E020FF
	for <regressions@lists.linux.dev>; Tue, 29 Mar 2022 08:01:44 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nZ6nM-0003wL-PP; Tue, 29 Mar 2022 10:01:41 +0200
Message-ID: <e2c9b59e-2b0f-8eab-def7-bc736b0ecce5@leemhuis.info>
Date: Tue, 29 Mar 2022 10:01:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Bug 215725] New: Basilisk X Hyperspeed Bluetooth LE mouse fail
 to connect under 5.17 with Opcode 0x2043 failure
Content-Language: en-US
References: <bug-215725-62941@https.bugzilla.kernel.org/>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 linux-bluetooth@vger.kernel.org, bugzilla-daemon@kernel.org
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
In-Reply-To: <bug-215725-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648540905;734e64e1;
X-HE-SMSGID: 1nZ6nM-0003wL-PP

Hi, this is your Linux kernel regression tracker.

On 22.03.22 14:38, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215725
> 
>             Bug ID: 215725
>            Summary: Basilisk X Hyperspeed Bluetooth LE mouse fail to
>                     connect under 5.17 with Opcode 0x2043 failure

Hey bluetooth maintainers, what's up here? That's a report about a
regression that was submitted more than a week ago. Has anything
happened to get it fixed? Reminder: this ideally should be fixed in
5.17.y before 5.16.y becomes EOL, which I guess will happen in round
about two or three weeks from now.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.


