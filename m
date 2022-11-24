Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9A92F25
	for <regressions@lists.linux.dev>; Thu, 24 Nov 2022 15:48:04 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oyESD-0007Tw-En; Thu, 24 Nov 2022 16:47:57 +0100
Message-ID: <2505800d-8625-dab0-576a-3a0221954ba3@leemhuis.info>
Date: Thu, 24 Nov 2022 16:47:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "Christian Brauner (Microsoft)" <brauner@kernel.org>,
 Pierre Labastie <pierre.labastie@neuf.fr>, Miklos Szeredi
 <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org
Subject: =?UTF-8?Q?=5bregression=2c_bisected=5d_Bug=c2=a0216738_-_Adding_O?=
 =?UTF-8?Q?=5fAPPEND_to_O=5fRDWR_with_fcntl=28fd=2c_F=5fSETFL=29_does_not_wo?=
 =?UTF-8?Q?rk_on_overlayfs?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669304885;9be93917;
X-HE-SMSGID: 1oyESD-0007Tw-En

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216738 :

>  Pierre Labastie 2022-11-24 14:53:33 UTC
> 
> Created attachment 303287 [details]
> C program for reproducing the bug
> 
> Not sure this is the right place to report this, but at least the offending commit

[offending commit is 164f4064ca8 ("keep iocb_flags() result cached in
struct file"), as specified in the "Kernel Version:" field in bugzilla]

> is in this component... 
> 
> Steps to reproduce:
> $ gcc repro.c
> $ rm -f toto
> $ ./a.out
> $ cat toto; echo
> 
> On an ext4 fs, the output is (on all versions):
> abcdefghijklmnopqr
> 
> Now, make an overlayfs:
> $ mkdir -p up lo wo mnt
> $ sudo mount -t overlay overlay -oupperdir=up,lowerdir=lo,workdir=wo mnt
> $ cd mnt
> $ rm f toto
> $ ../a.out
> $ cat toto; echo
> 
> before the said commit, the output is:
> abcdefghijklmnopqr
> 
> after the said commit, the output is:
> ghijklmnopqr
> 
> That is the file is truncated when opened with O_RDWR, with O_APPEND added later, but not when opened with both.

See the ticket for more details.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 164f4064ca8
https://bugzilla.kernel.org/show_bug.cgi?id=216738
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
