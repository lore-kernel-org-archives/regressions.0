Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C92C9C
	for <regressions@lists.linux.dev>; Mon, 10 Jan 2022 14:57:04 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n6w6Y-0003MW-4Q; Mon, 10 Jan 2022 15:57:02 +0100
Message-ID: <4f8b62ce-8d4a-9bf6-e75c-acb039ebec10@leemhuis.info>
Date: Mon, 10 Jan 2022 15:57:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: cifs: unable to mount cifs 1.0 shares because support for NTLM
 and weaker authentication algorithms was removed #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <dce98c91-d28c-0f5a-b177-1f4275cf0f35@leemhuis.info>
In-Reply-To: <dce98c91-d28c-0f5a-b177-1f4275cf0f35@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1641826624;f29b38fc;
X-HE-SMSGID: 1n6w6Y-0003MW-4Q




On 23.12.21 11:48, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression discussed in bugzilla I'd like to see tracked, to
> ensure it's not forgotten. Quoting a few parts of the report:
> 
>> After 5.15.0, I'm unable to mount a CIFS 1.0 share from a media player which I cannot update (vendor no longer provides updates).
>>
>> Original issue is logged here: https://bugs.gentoo.org/821895, with the most interesting bits probably being:
> 
>> Ok, 2.5 hours of bisecting later and I can confirm that the culprit is
>>
>> [76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c] cifs: remove support for NTLM and weaker authentication algorithms
>>
>> The commit before works fine, this commit prevents me from mounting the smb shares on my mede8er 600x 3d.
> 
> #regzbot introduced: 76a3c92ec9e0668e
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215375
> #regzbot link: https://bugs.gentoo.org/821895
> 
> I'm not CCing any of the developers for now, looks like they are
> handling it in bugzilla.
> 
> And yes, starting a extra thread for this is a hack hate myself, but I
> need some workaround for tracking due to the distributed nature of bug
> reporting with various different bug trackers in use (reminder:
> bugzilla.kernel.org is not the only one used by kernel developers).
> 
> Ciao, Thorsten
> 

There is a proper report now tracked by regzbot:

#regzbot dup-of:
https://lore.kernel.org/lkml/CAJjP=Bt52AW_w2sKnM=MbckPkH1hevPMJVWm_Wf%2BwThmR72YTg@mail.gmail.com/

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.
