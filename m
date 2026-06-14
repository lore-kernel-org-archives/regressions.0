Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C1E390235
	for <regressions@lists.linux.dev>; Sun, 14 Jun 2026 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781420543; cv=none; b=L2MZjKG+rX8fBemISCmItpf+Iq9aLQShqcWZAcAYG9ROKvWaZfHCV6C9lydTGzOZ82KEXN3kIZrQbmusoFgGVVaknKFF/frC53Syozyqs4p5713vEZ5jurksN1qxzWrX1r1dS/m/SiGcmldebUt2WJE2Xgyh7dMO40FVFg7ScCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781420543; c=relaxed/simple;
	bh=9J8rfFPSvShmtrjUZj4QoVh0lIvykGKg2X7Lp0+U5po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXdeo7BG/tYWSu2lN3bqD2KBPavNdkoTzivFioHvKnKL9+hrePhF2miJUcnpOFsHn94gXMKHvIr6BbtRxYT9ItU4DHYDgAazTqil+k/msFGWKvO+997nORbFPKxwuMQRuIDlWEZIKsDwYT4vkouD6PyRK9WOnRHx514lyX2AIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.217] (p57bd924b.dip0.t-ipconnect.de [87.189.146.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2D9E54C2C37F00;
	Sun, 14 Jun 2026 09:01:35 +0200 (CEST)
Message-ID: <197a07ba-7e97-4b89-81b3-82e21170a805@molgen.mpg.de>
Date: Sun, 14 Jun 2026 09:01:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Intel Corporation Device a876 (rev 10) firmware
 crashes since ed10eae8
To: =?UTF-8?Q?Bianca_F=C3=BCrstenau?=
 <furstenau+kernelbugWGvWw1PW1l@posteo.net>, Ravindra <ravindra@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Kiran K <kiran.k@intel.com>,
 Josh Boyer <jwboyer@redhat.com>
Cc: linux-firmware@kernel.org, linux-bluetooth@vger.kernel.org,
 regressions@lists.linux.dev, Sai Teja Aluvala <aluvala.sai.teja@intel.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Pierre-Olivier_Vall=C3=A8s?= <nibheis@gmail.com>
References: <635e5e63-dc67-4dac-8590-d613582c94c8@posteo.net>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <635e5e63-dc67-4dac-8590-d613582c94c8@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[To: +Josh, +Kiran]
[Cc: +linux-firmware@]

Am 13.06.26 um 23:09 schrieb Bianca Fürstenau:
> Dear Dmitry,
> 
> It seems that the linux-firmware commit ed10eae8 introduced a regression 
> causing the firmware to fail on Intel Corporation Device a876 (rev 10). 
> The next update to the firmware images in 7df47664 did not remedy this.
> 
> For dmesg extracts and other details, see:
> https://bugzilla.kernel.org/show_bug.cgi?id=221637 (Upstream bug report 
> where Thorsten informed us that we were sent to the wrong place)
> https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/-/work_items/45
> (Downstream bug report by Pierre-Olivier)
> https://github.com/NixOS/nixpkgs/issues/530344 (Downstream bug report by 
> me)
> 
> Please let us know if you need any further information. I’m sure both of 
> us would be happier to have working Bluetooth with current firmware 
> rather than at most one of these.
> 
> Kind regards,
> Bianca
> 
> ed10eae8: linux-firmware: Update firmware file for Intel BlazarI core
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/commit/ed10eae8facb3b4bf2da7104cec95afdf0209114
> 7df47664: linux-firmware: Update firmware file for Intel BlazarI core
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/commit/7df47664dd1d94111858b3224c15908517c73e73
> Merge Request for ed10eae8: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/955
> Merge Request for 7df47664: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1018
> 
> #regzbot introduced: ed10eae8facb3b4bf2da7104cec95afdf0209114
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=221637 
> [Bugzilla report]
> #regzbot monitor: https://lore.kernel.org/linux-bluetooth/bug-221637-62941@https.bugzilla.kernel.org%2F/
> #regzbot link: https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/-/work_items/45 [Arch downstream report]
> #regzbot link: https://github.com/NixOS/nixpkgs/issues/530344 [NixOS downstream report]
> #regzbot link: https://discussion.fedoraproject.org/t/bluetooth-not-working-on-fedora-cosmic-atomic-intel-core-ultra-7-kernel-7-0-8-200fc44-x86-64/191881 [Fedora downstream report]
