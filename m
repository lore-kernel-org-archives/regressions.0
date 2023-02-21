Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B744C64
	for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 14:58:58 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pUU6Z-0001uK-PR; Tue, 21 Feb 2023 15:58:55 +0100
Message-ID: <34432a13-f809-b1a7-e737-e5646880da5d@leemhuis.info>
Date: Tue, 21 Feb 2023 15:58:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: git regression failures with v6.2-rc NFS client
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Chuck Lever III <chuck.lever@oracle.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <9A4A5673-691D-47EC-BC44-C43BE7E50A48@oracle.com>
 <108fdc3a-58a1-c32a-efa6-aa0b5645e862@leemhuis.info>
In-Reply-To: <108fdc3a-58a1-c32a-efa6-aa0b5645e862@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676991538;d20a9676;
X-HE-SMSGID: 1pUU6Z-0001uK-PR

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 03.02.23 13:39, Linux kernel regression tracking (#adding) wrote:
> On 31.01.23 22:15, Chuck Lever III wrote:
>>
>> I upgraded my test client's kernel to v6.2-rc5 and now I get
>> failures during the git regression suite on all NFS versions.
>> I bisected to:
>>
>> 85aa8ddc3818 ("NFS: Trigger the "ls -l" readdir heuristic sooner")
>>
>> The failure looks like:
>> [...]
> 
> #regzbot ^introduced 85aa8ddc3818
> #regzbot title nfs: failures during the git regression suite on all NFS
> versions
> #regzbot ignore-activity

#regzbot resolved: corner case Linus was made aware of and apparently
didn't consider something that needs to be fixed
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

