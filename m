Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BF7E4
	for <regressions@lists.linux.dev>; Wed,  3 May 2023 04:46:22 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pu4Ng-0007IN-0A; Wed, 03 May 2023 06:46:20 +0200
Message-ID: <ebb280e4-d381-0bf8-d134-0318c5cfdf83@leemhuis.info>
Date: Wed, 3 May 2023 06:46:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Hang loading initrd since last Friday.
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Ben Greear
 <greearb@candelatech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <9d87defc-5376-d690-b483-bc314e4f568b@candelatech.com>
 <ZFHHh/m0pkOYIzo7@debian.me>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZFHHh/m0pkOYIzo7@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683089182;c7db01d3;
X-HE-SMSGID: 1pu4Ng-0007IN-0A

On 03.05.23 04:31, Bagas Sanjaya wrote:
> On Tue, May 02, 2023 at 02:03:33PM -0700, Ben Greear wrote:
>>
>> Pulling today's upstream 6.3+ tree, my system now hangs loading initrd.

Just to understand this properly: you mean after the boot loader said it
loaded the initramfs, not when the kernel starts using it?

>>  Nothing useful is seen on
>> serial console after that.  This was working late last week.  Other older kernels boot OK, so
>> I think is is related to the kernel.
> 
> What is your setup (especially kernel config)?
> 
> Is v6.3 works for you? I haven't seen this regression on my computer
> using v6.3.

Ben, you just to be sure might want to check if a kernel image that
currently works still boots if you regenerate its initramfs: maybe the
initramfs generator or something it uses changed recently and is causing
your problem. I've seen a case or two where that was the case.

>> I have not yet started bisect, curious if this is already know problem.
> Certainly you should try bisection.

Yeah.

BTW: What kind of platform is this?

Ciao, Thorsten
