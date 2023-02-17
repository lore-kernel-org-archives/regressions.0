Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C066AA9
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 13:50:36 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 13495240464
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 14:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1676641829; bh=GgTNAqG4K1Y0lL1gc1v2CXmfnK/B0UN0YQf+AkLzthE=;
	h=Date:From:To:Subject:From;
	b=KSauJRRNvoE0v5hxJqBUg2GVMxf7W0WmV3blDFnnRmUKd9wwgGYa4LMn3Did2t2AN
	 4QnntCjdU0Up+M+9jKIcjnLu0/27cfx3rWsJCud/JKbg5GcqQaNQ06NnQVer4YpJJ/
	 FkpTKHb69ggIvzHEp16mAHEGg1oOQZPD/TO79UbNecE1+ZFaCeddVezUdNR+BH9GWO
	 JU/2NtaxNtri3vwpuQVsktH0NkpTyYsMO/Yb/7KMYmyO6di+fGCXGehkK9L+OTqfUX
	 nNk0SaE5FbsLT/E2n0pjEaRVtS3q44E8nhOtD/XraVeuRStyksHcBPWEHjRRDn4mKL
	 H2lcdMjRvRjAQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4PJCr44bTTz6tnN
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 14:50:28 +0100 (CET)
Date: Fri, 17 Feb 2023 14:50:27 +0100 (GMT+01:00)
From: Julian <julian.g@posteo.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Message-ID: <81b5b28e-33fb-48ca-9e84-7574d5596bfb@posteo.de>
In-Reply-To: <f30eae62-c827-f743-acbe-867770714522@leemhuis.info>
References: <20230112164204.GA1768006@bhelgaas> <f30eae62-c827-f743-acbe-867770714522@leemhuis.info>
Subject: Re: Regression in Kernel 6.0: System partially freezes with "nvme
 controller is down"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <81b5b28e-33fb-48ca-9e84-7574d5596bfb@posteo.de>

Hello,

yes it is partially stalled. The reason being that I have run into the issu=
e on a 5.x kernel.
The issue sometimes takes days to reproduce, but I now think that it might =
be a hardware issue.
Whatever the case, it isn't a regression in 6.x.

I couldn't really do anything that Bjorn suggested, since the system is unr=
esponsive when the freeze issue happens. I am amazed that network logging s=
till works.

Greetings
Julian Gro=C3=9F

17.02.2023 13:40:02 Linux regression tracking (Thorsten Leemhuis) <regressi=
ons@leemhuis.info>:

> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
>=20
> I might be missing something, but it looks like this discussion stalled.
> I wonder why.
>=20
> Julian, did you ever share the data Bjorn asked for? Or tried a a
> bisection, as suggested by Keith? Or did you stop caring for some
> reason? Does everything maybe work fine these days?
>=20
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>=20
> #regzbot poke
>=20
> On 12.01.23 17:42, Bjorn Helgaas wrote:
>> On Thu, Jan 12, 2023 at 03:48:46PM +0100, Linux kernel regression tracki=
ng (Thorsten Leemhuis) wrote:
>>> ...
>>> On 11.01.23 23:11, Julian Gro=C3=9F wrote:
>>>> Dear Maintainer,
>>>>=20
>>>> when running Linux Kernel version 6.0.12, 6.0.10, 6.0-rc7, or 6.1.4, m=
y
>>>> system seemingly randomly freezes due to the file system being set to
>>>> read-only due to an issue with my NVMe controller.
>>>> The issue does *not* appear on Linux Kernel version 5.19.11 or lower.
>>>>=20
>>>> Through network logging I am able to catch the issue:
>>>> ```
>>>> Jan=C2=A0 8 14:50:16 x299-desktop kernel: [ 1461.259288] nvme nvme0:
>>>> controller is down; will reset: CSTS=3D0xffffffff, PCI_STATUS=3D0x10
>>>> Jan=C2=A0 8 14:50:16 x299-desktop kernel: [ 1461.259293] nvme nvme0: D=
oes
>>>> your device have a faulty power saving mode enabled?
>>>> Jan=C2=A0 8 14:50:16 x299-desktop kernel: [ 1461.259293] nvme nvme0: T=
ry
>>>> "nvme_core.default_ps_max_latency_us=3D0 pcie_aspm=3Doff" and report a=
 bug
>>>> Jan=C2=A0 8 14:50:16 x299-desktop kernel: [ 1461.331360] nvme 0000:01:=
00.0:
>>>> enabling device (0000 -> 0002)
>>>> ...
>>>>=20
>>>> I have tried the suggestion in the log without luck.
>>>>=20
>>>> Attached is a log that includes two system freezes, as well as a list =
of
>>>> PCI(e) devices created by Debian reportbug.
>>>> The first freeze happens at "Jan=C2=A0 8 04:26:28" and the second free=
ze
>>>> happens at "Jan=C2=A0 8 14:50:16".
>>>>=20
>>>> Currently, I am using git bisect to narrow down the window of possible
>>>> commits, but since the issue appears seemingly random, it will take ma=
ny
>>>> months to identify the offending commit this way.
>>>>=20
>>>> The original Debian bug report is here:
>>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1028309
>>=20
>> For some reason the log [1] has very little of the kernel dmesg log.
>> It does seem like the freeze is partial (I see messages for hundreds
>> or thousands of seconds after the nvme reset), but requires a reboot
>> to recover.
>>=20
>> The lspci information [2] shows the 00:1b.0 Root Port leading to the
>> 01:00.0 NVMe device.
>>=20
>> Is it possible to collect lspci output after the nvme freeze?=C2=A0 If s=
o,
>> please save the output of:
>>=20
>> =C2=A0 sudo lspci -vv -s00:1b.0
>> =C2=A0 sudo lspci -vv -s01:00.0
>>=20
>> Make sure to run lspci as root so we can see the error logging
>> registers for these devices.
>>=20
>> If you can collect more of the dmesg log after the freeze, e.g., via
>> the "dmesg" command, that might be helpful, too.
>>=20
>> Bjorn
>>=20
>> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D1;bug=3D1028309;=
filename=3Dx299-desktop_crash.log.xz;msg=3D5
>> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D0;bug=3D1028309;=
msg=3D5
>>=20
>>=20
