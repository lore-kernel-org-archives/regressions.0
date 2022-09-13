Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838CF3C10
	for <regressions@lists.linux.dev>; Tue, 13 Sep 2022 15:37:13 +0000 (UTC)
Received: from [185.122.133.20] (helo=[172.16.40.43]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oY7yJ-0006Fz-Ee; Tue, 13 Sep 2022 17:37:11 +0200
Message-ID: <6c0f6043-8aa0-2516-38de-b2b9f4a22401@leemhuis.info>
Date: Tue, 13 Sep 2022 16:37:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [Bug] [Deadlock] Kernel thread deadlock in rfcomm socket release
 when connect interrupted
Content-Language: en-US, de-DE
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev,
 Peter Sutton <peter@foxdogstudios.com>
References: <CAD+dNTsbuU4w+Y_P7o+VEN7BYCAbZuwZx2+tH+OTzCdcZF82YA@mail.gmail.com>
 <24e95c8b-dc05-0d00-50bb-58b71c5baf94@molgen.mpg.de>
 <CAD+dNTuRThoa2OSzQ27tENB29GJ4oD0j3D+P4k42HzopEeTJMw@mail.gmail.com>
 <CAD+dNTsqBEjzG7BinKtxveH9faJqss89WPufbSsaB5FZRDgOPA@mail.gmail.com>
 <ef7a1421-06c5-f3b7-8c7f-7fdfd7862c96@molgen.mpg.de>
 <e7c8127a-d561-3a3d-f208-770f3abbee17@leemhuis.info>
 <CAD+dNTsnVpyFKyZcAgnqAZz-e2upjFd3NGWV=hPhywL8k0g6Nw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAD+dNTsnVpyFKyZcAgnqAZz-e2upjFd3NGWV=hPhywL8k0g6Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1663083433;4e1e108d;
X-HE-SMSGID: 1oY7yJ-0006Fz-Ee



On 13.09.22 16:20, Peter Sutton wrote:
>>  a fix for a deadlock for RFCOMM sk state change was posted last year already:
>>
>> https://lore.kernel.org/all/20211004180734.434511-1-desmondcheongzx@gmail.com/
>>
>> It seems it never went anywhere, unless I'm missing something. Is that
>> maybe the same problem or somehow related?
> 
> I mentioned this on the Arch Linux Matrix channel. The `linux` package
> maintainer said they had encountered the same and added the linked
> patch to the Arch Linux kernel package but removed it because it
> wasn't merged (which explains why my issue went way then came back).
> Anyway, we compiled a 5.19.8 `linux` package with the patch (which
> fixes my issue) and they said they'll add the patch back to the linux
> package.

Well, that's fine and hopefully will solve your issue soon, but the arch
maintainers are right: this should be fixed upstream.

Luiz, is there a reason why that patch wasn't merged? What is needed to
get this merged, ideally while adding a "Link:
https://lore.kernel.org/all/CAD+dNTsbuU4w+Y_P7o+VEN7BYCAbZuwZx2+tH+OTzCdcZF82YA@mail.gmail.com/"
tag?

Ciao, Thorsten
