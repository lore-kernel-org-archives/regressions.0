Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611EA6FA3
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qySNm-0005b3-19; Thu, 02 Nov 2023 08:44:50 +0100
Message-ID: <877c9bed-181a-4fc0-a876-e17de65c9e4d@leemhuis.info>
Date: Thu, 2 Nov 2023 08:44:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Requesting your attention and expertise regarding a Tablet/Kernel
 issue
Content-Language: en-US, de-DE
To: Jiri Kosina <jkosina@suse.cz>, David Revoy <davidrevoy@protonmail.com>
Cc: "jason.gerecke@wacom.com" <jason.gerecke@wacom.com>,
 "jose.exposito89@gmail.com" <jose.exposito89@gmail.com>,
 "ilya.ostapyshyn@gmail.com" <ilya.ostapyshyn@gmail.com>,
 Nils Fuhler <nils@nilsfuhler.de>, Ping Cheng <ping.cheng@wacom.com>,
 Peter Hutterer <peter.hutterer@who-t.net>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <kRKTNDYigUSblpNgSuZ2H4dX03Of1yD4j_L9GgbyKXcDqZ67yh5HOQfcd7_83U3jZuQzxpKT3L6FXcRkkZIGdl_-PQF14oIB0QmRSfvpc2k=@protonmail.com>
 <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <nycvar.YFH.7.76.2311012033290.29220@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698911103;309bd6cd;
X-HE-SMSGID: 1qySNm-0005b3-19

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 01.11.23 20:37, Jiri Kosina wrote:
> On Wed, 1 Nov 2023, David Revoy wrote:
> 
>> Hi Jason Gerecke, José Expósito, Jiri Kosina and Illia Ostapyshyn,
>>
>> I am emailing to draw your attention and expertise to a problem I had 
>> earlier this week with my Xp-Pen Artist 24 Pro display tablet under 
>> Fedora Linux 38 KDE after a kernel update.
>>
>> The second button on my stylus changed from a right-click (which I could 
>> customise with xsetwacom or any GUI like kcm-tablet) to a button that 
>> feels 'hardcoded' and now switches the whole device to an eraser mode. 
>> This makes my main tool unusable.
>>
>> I don't have the skills to write a proper kernel bug report, workaround 
>> or even identify the exact source of the issue. I have written a blog 
>> post about this with more details here: 
>> https://www.davidrevoy.com/article995/how-a-kernel-update-broke-my-stylus-need-help 
>> , contacting you was something suggested by the comments.
>>
>> Thank you very much if you can help me.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 276e14e6c3
https://www.davidrevoy.com/article995/how-a-kernel-update-broke-my-stylus-need-help

#regzbot title HID: input: stylus of Xp-Pen Artist 24 Pro display tablet
changed behavior
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
