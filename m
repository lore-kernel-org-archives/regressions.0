Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1FB11718
	for <regressions@lists.linux.dev>; Fri, 29 Sep 2023 13:24:11 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qmDTV-0004ck-1g; Fri, 29 Sep 2023 15:24:09 +0200
Message-ID: <44fa4252-df03-41ae-928e-c13c69de12c4@leemhuis.info>
Date: Fri, 29 Sep 2023 15:24:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [czhong@redhat.com: [bug report] WARNING: CPU: 121 PID: 93233 at
 fs/dcache.c:365 __dentry_kill+0x214/0x278]
Content-Language: en-US, de-DE
To: Linux Regressions <regressions@lists.linux.dev>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <ZOWFtqA2om0w5Vmz@fedora>
 <20230823-kuppe-lassen-bc81a20dd831@brauner>
 <CAFj5m9KiBDzNHCsTjwUevZh3E3RRda2ypj9+QcRrqEsJnf9rXQ@mail.gmail.com>
 <CAHj4cs_MqqWYy+pKrNrLqTb=eoSOXcZdjPXy44x-aA1WvdVv0w@mail.gmail.com>
 <ZQZJtHHPZwCeQH9v@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZQZJtHHPZwCeQH9v@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695993851;09d1418b;
X-HE-SMSGID: 1qmDTV-0004ck-1g

On 17.09.23 02:35, Bagas Sanjaya wrote:
> On Wed, Sep 13, 2023 at 04:59:31PM +0800, Yi Zhang wrote:
>> The issue still can be reproduced on the latest linux tree[2].
>> To reproduce I need to run about 1000 times blktests block/001, and
>> bisect shows it was introduced with commit[1], as it was not 100%
>> reproduced, not sure if it's the culprit?
> 
> Anyway, thanks for bisecting this regression. I'm adding it to regzbot:
> 
> #regzbot ^introduced: 9257959a6e5b4f
> #regzbot title: restructuring atomic locking conditionals causes vfs dentry lock protection failure

#regzbot fix: 6d2779ecaeb56f
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

