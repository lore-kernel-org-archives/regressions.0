Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6878F611E
	for <regressions@lists.linux.dev>; Sun, 12 Apr 2026 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775993147; cv=none; b=K7qXldoHkaMw2pehb0ERN7MTB3GYltR7z+YdKR3sVAzUHxDjDSGTKXjHzTiT7BKAJCam4/4oIDC5BpiKQaA8fTSsUaP/OmUHul3WJz5r9l/n6ZDIy8981d8ymmq2BoVcRdxDBlWzhcg+PnM1qsUp0gZuRXBs+MJUuqaKfI0Mqcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775993147; c=relaxed/simple;
	bh=XPzIPlFhXf6fmRUvCLaUIiWU6MLIEfddP+HG2LJ0Jrs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PUlUo6bEjByL9IN7DtaioMwvbLm98aPON/4EwD3wIN/48VSqdu/sV5DavNTvqsvcQetamxm39KKEUpSk2qU2WhiKIp3RVQXO4j6n3+8nKdUOV+XugW3nrah5KyE1+FrofsUqDkbn891RIlo31TEuYX83ztrOipXM/y3vwP81xks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hdN0cOWA; arc=none smtp.client-ip=79.135.106.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hdN0cOWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1775993138; x=1776252338;
	bh=XPzIPlFhXf6fmRUvCLaUIiWU6MLIEfddP+HG2LJ0Jrs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hdN0cOWAy8xzQWID1epLPwrW6+eTN37SazUymeBha/uoxN5bJw2EXsKXYH+VujiH9
	 BSVKW3CmzycG5HC/ilhIGkQzyrcx+QnD41kID+Jd+riWm3mIcolaq9ta0WdSzNVDgZ
	 bnPygeW+O9IeJRz1qx/QBkIb+EV9PRIZM2a+QtQVidELAtX7iruQPPZ6ytVe/ihYjS
	 2k5r+2Jia/sFdQaqAmH6LA2bo0rRDJSee8kBfdAKGOrH/uBeJomnlQopXj1/MWFlEM
	 2csRUVQpFQicm6WfmsM4jO2eswAqra8o5D8f6tW2sj/yZwv+xcUPSSqw3Um53yF6ul
	 taPY2v6ZLQsfg==
Date: Sun, 12 Apr 2026 11:25:34 +0000
To: "iommu@lists.linux.dev" <iommu@lists.linux.dev>
From: 70sp <70sp@protonmail.com>
Cc: "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: [REGRESSION] GPU passes into VM improperly after c376a3456d8b or a98db518dde2
Message-ID: <HYhMd0Klo0XE_yiVY7XmsgyKKFDwKHfKRy22KrycLcYd0V_ykA4xdbBMJXkA07YX3os6qK-NhMIVi6ITo-CkNIIF0e-GcI0UwwZmdDhAJ0I=@protonmail.com>
Feedback-ID: 144929603:user:proton
X-Pm-Message-ID: 26f8abaf4b873fdaaf68ec791466805a3e97048a
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I have been dealing with a regression launching a Windows QEMU/KVM virtual =
machine with a GPU passed through.

The issue consists of launching a QEMU/KVM VM, which gets stuck for about 2=
 minutes on booting with a white screen and then having NVIDIA=E2=80=99s co=
de 43 in Windows.

I=E2=80=99m certain, that the issue is not caused by anything in Windows or=
 related software in Linux, because I tried reinstalling my whole PC includ=
ing the Windows VM. I tried to reproduce the bug on an out-of-the-box Arch =
Linux install and the bug is still present.

The first bad commit is either a98db518dde246e01ead53617dc0a30d6aaa3752 or =
c376a3456d8bef43ec556a98c0a04c35086c2737. I don=E2=80=99t know for sure whi=
ch one introduced it, because during bisection I had to skip a98db518dde246=
e01ead53617dc0a30d6aaa3752 due to it being unable to launch the virtual mac=
hine resulting in a different error (didn=E2=80=99t even start booting). In=
 kernels before these commits, the VM works flawlessly.

I have tested it on latest mainline kernel and the issue is still present. =
I have been experiencing the issue since kernel 6.13, so I just switched to=
 the 6.12 LTS kernel instead which doesn=E2=80=99t have this issue.

Configuration of my Linux install and hardware: https://pastebin.com/rcsyyY=
iK
.config: https://pastebin.com/RTQCBduD
dmesg errors: https://pastebin.com/84jPP81E
lspci: https://pastebin.com/qi29BSWi

#regzbot introduced: a98db518dde246e01ead53617dc0a30d6aaa3752..c376a3456d8b=
ef43ec556a98c0a04c35086c2737

Best Regards,
=C5=A0imon Posp=C3=ADchal
