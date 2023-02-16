Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7734746E
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 14:53:31 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSfdZ-0003Aj-Vt; Thu, 16 Feb 2023 15:53:30 +0100
Message-ID: <7d40eead-93ac-8585-f13a-9479bf4d9efd@leemhuis.info>
Date: Thu, 16 Feb 2023 15:53:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903 (046d:c091)
 report too many non-hires events
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Salvatore Bonaccorso <carnil@debian.org>,
 Tobias Klausmann <klausman@schwarzvogel.de>
Cc: linux-input@vger.kernel.org, regressions@lists.linux.dev
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
 <Y9VBz/GVZPqG3KwM@eldamar.lan>
 <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
In-Reply-To: <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676559212;23ae314d;
X-HE-SMSGID: 1pSfdZ-0003Aj-Vt

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 28.01.23 17:28, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> On 28.01.23 16:39, Salvatore Bonaccorso wrote:
>> On Wed, Jan 25, 2023 at 11:01:00PM +0100, Tobias Klausmann wrote:
>>> Hi!
>>>
>>> As it says in the subject.
>>>
>>> At some point between 6.0 and 6.1, the kernel (if HID_LOGITECH_HIDPP was
>>> m or y) started reporting a full event for every hires event on a
>>> Logitech G903. 

Just noticed that regzbot missed noticing the fix for this thread:

#regzbot fix: 690eb7dec72ae52d
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
