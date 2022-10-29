Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72A23C0
	for <regressions@lists.linux.dev>; Sat, 29 Oct 2022 09:59:15 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ooicN-0004aR-F4; Sat, 29 Oct 2022 11:59:07 +0200
Message-ID: <b3b9b46e-31cc-3aab-b1be-8f982df11eb3@leemhuis.info>
Date: Sat, 29 Oct 2022 11:59:06 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [Regression] CPU stalls and eventually causes a complete system
 freeze with 6.0.3 due to "video/aperture: Disable and unregister sysfb
 devices via aperture helpers" #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
In-Reply-To: <bbf7afe7-6ed2-6708-d302-4ba657444c45@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667037555;1dc780a6;
X-HE-SMSGID: 1ooicN-0004aR-F4

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 23.10.22 10:04, Thorsten Leemhuis wrote:
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216616  :

> #regzbot introduced: cfecfc98a78d9
> https://bugzilla.kernel.org/show_bug.cgi?id=216616
> #regzbot ignore-activity

#regzbot fixed-by: 25a6688f27ff54f97adf7cce1d7e18c38bf51eb
